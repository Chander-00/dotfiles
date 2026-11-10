#!/bin/bash
# Reproduces this dotfiles setup on a fresh Linux box.
#   - Arch-based (Arch, Garuda, EndeavourOS, ...): pacman + fish
#   - Debian/Ubuntu-based: apt + Homebrew + zsh
# Idempotent: safe to re-run. Existing configs are backed up, never deleted.
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"

if command -v pacman &>/dev/null; then
	DISTRO=arch
elif command -v apt-get &>/dev/null; then
	DISTRO=debian
else
	echo "Unsupported distro: need pacman (Arch-based) or apt-get (Debian/Ubuntu-based)." >&2
	exit 1
fi
echo "==> Detected $DISTRO-based system"

# link SRC DEST: point DEST at SRC. A real file/dir already at DEST is moved
# to DEST.bak.<timestamp> first; an old symlink is just replaced.
link() {
	local src="$1" dest="$2"
	mkdir -p "$(dirname "$dest")"
	if [ -L "$dest" ]; then
		rm "$dest"
	elif [ -e "$dest" ]; then
		local backup
		backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
		echo "    backing up $dest -> $backup"
		mv "$dest" "$backup"
	fi
	ln -s "$src" "$dest"
}

# ---------------------------------------------------------------------------
# Packages
# ---------------------------------------------------------------------------
if [ "$DISTRO" = arch ]; then
	echo "==> Packages (pacman)"
	# -Syu, not -Sy: partial upgrades are unsupported on Arch.
	sudo pacman -Syu --needed --noconfirm \
		base-devel curl git unzip jq \
		fish starship wezterm \
		zellij fzf ripgrep bat fd eza git-delta lazygit zoxide fnm go neovim \
		wl-clipboard xclip \
		ugrep expac fastfetch \
		ttf-iosevkaterm-nerd otf-monaspace-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-mono
else
	echo "==> Base packages (apt)"
	sudo apt-get update
	sudo apt-get install -y build-essential curl file git unzip fontconfig zsh jq

	echo "==> Homebrew"
	if ! command -v brew &>/dev/null && [ ! -x "$BREW_BIN" ]; then
		NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	eval "$("$BREW_BIN" shellenv)"

	echo "==> Brew packages"
	brew install zellij fzf ripgrep bat fd eza git-delta xclip lazygit zoxide fnm go neovim \
		zsh-autosuggestions zsh-syntax-highlighting

	echo "==> Nerd Font (IosevkaTerm)"
	if ! fc-list | grep -qi "IosevkaTerm Nerd Font"; then
		mkdir -p ~/.local/share/fonts
		curl -L -o /tmp/IosevkaTerm.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
		unzip -o /tmp/IosevkaTerm.zip -d ~/.local/share/fonts/IosevkaTermNF
		rm /tmp/IosevkaTerm.zip
		fc-cache -f
	fi

	echo "==> oh-my-zsh"
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	fi

	echo "==> Powerlevel10k"
	ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
	if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
	fi

	echo "==> fzf-git.sh"
	mkdir -p ~/.local/share/fzf-git
	curl -fsSL -o ~/.local/share/fzf-git/fzf-git.sh https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
fi

# ---------------------------------------------------------------------------
# Configs (symlinked to this repo: edit here, changes apply immediately)
# ---------------------------------------------------------------------------
echo "==> Configs (symlinked to this repo)"
link "$DOTFILES_DIR/ZellijConfigs/zellij" ~/.config/zellij
link "$DOTFILES_DIR/NvimConfigs/nvim" ~/.config/nvim

mkdir -p ~/.config/bat/themes
if [ -d "$DOTFILES_DIR/BatConfigs/themes" ]; then
	for theme in "$DOTFILES_DIR"/BatConfigs/themes/*.tmTheme; do
		ln -sf "$theme" ~/.config/bat/themes/
	done
fi
bat cache --build

if [ "$DISTRO" = arch ]; then
	# Link individual files, not the whole dir: fish writes machine-specific
	# state (fish_variables, completions) into ~/.config/fish.
	link "$DOTFILES_DIR/FishConfigs/fish/config.fish" ~/.config/fish/config.fish
	for f in "$DOTFILES_DIR"/FishConfigs/fish/conf.d/*.fish; do
		link "$f" ~/.config/fish/conf.d/"$(basename "$f")"
	done
	# WezTerm: fish-based config. (.wezterm.lua at the repo root is the zsh/Debian one.)
	link "$DOTFILES_DIR/WeztermConfigs/wezterm.lua" ~/.config/wezterm/wezterm.lua
	# Drop a ~/.wezterm.lua pointing at the zsh config so it can't shadow this one.
	if [ "$(readlink ~/.wezterm.lua 2>/dev/null)" = "$DOTFILES_DIR/.wezterm.lua" ]; then
		rm ~/.wezterm.lua
	fi
else
	link "$DOTFILES_DIR/ZshConfigs/.zshrc" ~/.zshrc
	link "$DOTFILES_DIR/ZshConfigs/.p10k.zsh" ~/.p10k.zsh
	link "$DOTFILES_DIR/.wezterm.lua" ~/.wezterm.lua
fi

echo "==> Node (fnm)"
fnm install --lts
fnm default lts-latest

# ---------------------------------------------------------------------------
# Default shell
# ---------------------------------------------------------------------------
echo "==> Default shell"
if [ "$DISTRO" = arch ]; then
	TARGET_SHELL="$(command -v fish)"
else
	TARGET_SHELL="$(command -v zsh)"
fi
if [ "$(getent passwd "$USER" | cut -d: -f7)" != "$TARGET_SHELL" ]; then
	chsh -s "$TARGET_SHELL" "$USER" || echo "chsh failed, set it manually: chsh -s $TARGET_SHELL"
else
	echo "    already $TARGET_SHELL"
fi

cat <<'EOF'

Done. Still manual (by design, not automated):
  - Generate/copy SSH keys and set up ~/.ssh/config for work vs personal hosts.
  - Log out and back in (or reboot) if the default shell changed.
  - Open nvim once so lazy.nvim installs plugins (Mason then installs LSPs).
EOF
