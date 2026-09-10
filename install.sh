#!/bin/bash
# Reproduces this dotfiles setup on a fresh Debian/Ubuntu-based Linux box.
# Idempotent: safe to re-run.
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"

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

echo "==> Configs (copied, not symlinked)"
cp "$DOTFILES_DIR/ZshConfigs/.zshrc" ~/.zshrc
cp "$DOTFILES_DIR/ZshConfigs/.p10k.zsh" ~/.p10k.zsh
mkdir -p ~/.config/zellij ~/.config/nvim ~/.config/bat/themes
cp -r "$DOTFILES_DIR"/ZellijConfigs/zellij/* ~/.config/zellij/
cp -r "$DOTFILES_DIR"/NvimConfigs/nvim/* ~/.config/nvim/
[ -d "$DOTFILES_DIR/BatConfigs/themes" ] && cp "$DOTFILES_DIR"/BatConfigs/themes/*.tmTheme ~/.config/bat/themes/ 2>/dev/null
bat cache --build
ln -sf "$DOTFILES_DIR/.wezterm.lua" ~/.wezterm.lua

echo "==> Node (fnm)"
fnm install --lts
fnm default lts-latest

echo "==> Default shell"
chsh -s "$(which zsh)" "$USER" || echo "chsh failed, set it manually: chsh -s \$(which zsh)"

cat <<'EOF'

Done. Still manual (by design, not automated):
  - Generate/copy SSH keys and set up ~/.ssh/config for work vs personal hosts.
  - Log out and back in (or reboot) so the new default shell takes effect.
  - Open a new terminal: p10k will prompt to reconfigure only if ~/.p10k.zsh is missing (it isn't, so it won't).
EOF
