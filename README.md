# dotfiles

Personal dev environment: zsh + oh-my-zsh + powerlevel10k, zellij, Neovim (LazyVim), WezTerm, and a Catppuccin-Macchiato-themed CLI toolset (fzf, bat, delta, eza, ripgrep, fd, zoxide, fnm, go, lazygit).

## Install (fresh Debian/Ubuntu-based machine)

```bash
git clone git@github.com:Chander-00/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script is idempotent (safe to re-run) and:
- Installs base build deps via `apt`
- Installs Homebrew, then everything else through it (zellij, fzf, ripgrep, bat, fd, eza, git-delta, xclip, lazygit, zoxide, fnm, go, neovim, zsh-autosuggestions, zsh-syntax-highlighting)
- Installs the IosevkaTerm Nerd Font
- Installs oh-my-zsh + Powerlevel10k
- Installs fzf-git.sh
- Copies (not symlinks) `.zshrc`, `.p10k.zsh`, zellij config, nvim config, and the bat theme into place
- Symlinks `.wezterm.lua` to `~/.wezterm.lua`
- Installs Node LTS via fnm
- Sets zsh as the default shell

## Not automated (on purpose)

- **SSH keys** — generate/copy these yourself and set up `~/.ssh/config` to keep work and personal hosts on separate keys (`IdentitiesOnly yes` per `Host` block). Security-sensitive and machine-specific; not something to script.
- **Log out / log back in** (or reboot) after install so the new default shell actually takes effect.
- **WezTerm itself** — install it via your OS's package manager/site; this repo only supplies its config.

## Reference

See [`KEYBINDINGS.md`](./KEYBINDINGS.md) for every keybinding across zellij, WezTerm, zsh, fzf, fzf-git, Neovim/LazyVim, and delta.

## Layout

| Path | What |
|---|---|
| `.wezterm.lua` | WezTerm config |
| `ZshConfigs/` | `.zshrc`, `.p10k.zsh` |
| `ZellijConfigs/zellij/` | zellij config, layouts, plugins, themes |
| `NvimConfigs/nvim/` | full LazyVim config |
| `BatConfigs/themes/` | Catppuccin Macchiato theme for `bat` |
| `install.sh` | fresh-machine setup script |
