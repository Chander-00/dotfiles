# dotfiles

Personal dev environment: zsh + oh-my-zsh + powerlevel10k, zellij, Neovim (LazyVim), WezTerm, and a Catppuccin-Macchiato-themed CLI toolset (fzf, bat, delta, eza, ripgrep, fd, zoxide, fnm, go, lazygit).

## Install

```bash
git clone git@github.com:Chander-00/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script detects the distro and is idempotent (safe to re-run). Existing configs are moved to `<name>.bak.<timestamp>`, never deleted.

### Arch-based (Arch, Garuda, EndeavourOS, ...)

- Installs everything with `pacman` (fish, starship, wezterm, zellij, fzf, ripgrep, bat, fd, eza, git-delta, lazygit, zoxide, fnm, go, neovim, wl-clipboard/xclip, ugrep, expac, fastfetch, Nerd Fonts)
- Symlinks the fish config (`config.fish` + `conf.d/`), WezTerm config (`WeztermConfigs/wezterm.lua`, launches fish), zellij config (zjstatus bar), nvim config, and bat theme into place
- Installs Node LTS via fnm
- Sets fish as the default shell (fish auto-starts zellij)

### Debian/Ubuntu-based

- Installs base build deps via `apt`
- Installs Homebrew, then everything else through it (zellij, fzf, ripgrep, bat, fd, eza, git-delta, xclip, lazygit, zoxide, fnm, go, neovim, zsh-autosuggestions, zsh-syntax-highlighting)
- Installs the IosevkaTerm Nerd Font
- Installs oh-my-zsh + Powerlevel10k
- Installs fzf-git.sh
- Symlinks `.zshrc`, `.p10k.zsh`, `.wezterm.lua`, the zellij config, the nvim config, and the bat theme into place — edit them in this repo and the changes apply immediately
- Installs Node LTS via fnm
- Sets zsh as the default shell

## Not automated (on purpose)

- **SSH keys** — generate/copy these yourself and set up `~/.ssh/config` to keep work and personal hosts on separate keys (`IdentitiesOnly yes` per `Host` block). Security-sensitive and machine-specific; not something to script.
- **Log out / log back in** (or reboot) after install so the new default shell actually takes effect.
- **WezTerm itself (Debian only)** — install it via your OS's package manager/site; this repo only supplies its config. The Arch path installs it with pacman.

## Reference

See [`KEYBINDINGS.md`](./KEYBINDINGS.md) for every keybinding across zellij, WezTerm, zsh, fzf, fzf-git, Neovim/LazyVim, and delta.

## Layout

| Path | What |
|---|---|
| `.wezterm.lua` | WezTerm config (Debian/zsh) |
| `WeztermConfigs/wezterm.lua` | WezTerm config (Arch/fish) |
| `FishConfigs/fish/` | fish `config.fish` + `conf.d/` (Arch path) |
| `ZshConfigs/` | `.zshrc`, `.p10k.zsh` |
| `ZellijConfigs/zellij/` | zellij config, layouts, plugins, themes |
| `NvimConfigs/nvim/` | full LazyVim config |
| `BatConfigs/themes/` | Catppuccin Macchiato theme for `bat` |
| `install.sh` | fresh-machine setup script |
