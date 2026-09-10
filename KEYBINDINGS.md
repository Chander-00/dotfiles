# Keybindings Cheat Sheet

Generated from your actual configs on 2026-09-10. Update this file if you change any of the source configs below.

---
## Zellij
Source: `~/.config/zellij/config.kdl`

`Ctrl g` toggles between **locked** mode (keys pass through to the shell/app) and **normal** mode (zellij reads keys). You're locked by default. Everything below happens after `Ctrl g`.

### Mode switches (from normal)
| Key | Action |
|---|---|
| `p` | Pane mode |
| `t` | Tab mode |
| `r` | Resize mode |
| `s` | Scroll mode |
| `m` | Move mode |
| `o` | Session mode |
| `Ctrl q` | Quit zellij |
| `Esc` / `Enter` | Back to locked |

### Always available (normal + locked)
| Key | Action |
|---|---|
| `Alt` + `h/j/k/l` or arrows | Move focus between panes / tabs |
| `Alt n` | New pane |
| `Alt f` | Toggle floating panes |
| `Alt +` / `Alt -` / `Alt =` | Resize pane |
| `Alt [` / `Alt ]` | Previous/next swap layout |
| `Alt i` / `Alt o` | Move tab left/right |
| `Alt y` | Open "forgot the keybind?" cheat-sheet plugin |

### Pane mode (`Ctrl g` then `p`)
| Key | Action |
|---|---|
| `h/j/k/l` or arrows | Move focus |
| `n` | New pane |
| `d` | New pane below |
| `r` | New pane to the right |
| `x` | Close focused pane |
| `f` | Toggle fullscreen |
| `w` | Toggle floating panes |
| `e` | Embed/float toggle |
| `c` | Rename pane |
| `z` | Toggle pane frames |
| `Tab` | Switch focus |

### Tab mode (`Ctrl g` then `t`)
| Key | Action |
|---|---|
| `h/j/k/l` or arrows | Go to prev/next tab |
| `1`-`9` | Go to tab N |
| `n` | New tab |
| `x` | Close tab |
| `r` | Rename tab (type name, `Enter` to confirm — locks auto-rename) |
| `s` | Toggle sync tab (mirror input to all panes) |
| `b` | Break pane into new tab |
| `[` / `]` | Break pane left/right |
| `Tab` | Toggle last active tab |

### Resize mode (`Ctrl g` then `r`)
| Key | Action |
|---|---|
| `h/j/k/l` | Increase size toward that side |
| `H/J/K/L` | Decrease size toward that side |
| `+` / `-` / `=` | Increase/decrease |

### Move mode (`Ctrl g` then `m`)
| Key | Action |
|---|---|
| `h/j/k/l` or arrows | Move pane in that direction |
| `n` | Move to next pane |
| `p` | Move to previous pane |

### Scroll mode (`Ctrl g` then `s`)
| Key | Action |
|---|---|
| `j/k` or arrows | Scroll down/up |
| `Ctrl f` / `Ctrl b` | Page down/up |
| `d` | Half page down |
| `f` | Enter search |
| `e` | Edit scrollback in `$EDITOR` |

### Session mode (`Ctrl g` then `o`)
| Key | Action |
|---|---|
| `d` | Detach session |
| `w` | Open session manager |
| `p` | Open plugin manager |
| `c` | Open zellij configuration UI |

---
## WezTerm
Source: `~/.wezterm.lua`

No custom keybindings defined — uses WezTerm's defaults (e.g. `Ctrl Shift C/V` copy/paste, `Ctrl Shift T` new tab). `config.default_prog` is set to `/usr/bin/zsh`.

---
## zsh / oh-my-zsh
Source: `~/.zshrc`

| Command/key | Action |
|---|---|
| `cd <query>` | Aliased to `z` (zoxide) — fuzzy-jumps to frecent directories, not just literal paths |
| Type + `→` (right arrow) | Accept zsh-autosuggestions ghost-text suggestion |
| Typing a command | zsh-syntax-highlighting colors it green (valid) / red (invalid) live |
| `exec zellij` on shell start | Auto-launches zellij, guarded against nesting via `$ZELLIJ`/`$TMUX` checks |
| `ls` | Aliased to `eza` (color, long, git status, icons, no size/time/user/permissions columns) |

---
## delta (git pager)
Source: `~/.gitconfig` — replaces git's default diff pager. Side-by-side view, line numbers, Catppuccin Macchiato syntax theme.

| Key (while paging a diff) | Action |
|---|---|
| `n` / `N` | Jump to next/previous diff hunk (`delta.navigate=true`) |
| Standard pager keys (`space`, `q`, `/`, arrows) | Apply as usual (delta pipes through `less`) |

---
## fzf
Source: `~/.zshrc` (via `source <(fzf --zsh)`), backed by `fd` instead of the default find/grep.

| Key | Action |
|---|---|
| `Ctrl r` | Fuzzy-search shell command history |
| `Ctrl t` | Fuzzy-find a file/dir (via `fd`), preview with `bat`, insert at cursor |
| `Alt c` | Fuzzy-find a directory (via `fd`), preview as `eza --tree`, `cd` into it |
| `Tab` (after `**`, e.g. `vim **<Tab>`) | Fuzzy path/dir completion, also backed by `fd`; preview depends on command (`cd` → tree, `export`/`unset` → var value, `ssh` → `dig`, else → `bat`) |

---
## Neovim (LazyVim, `~/.config/nvim`)
Leader key: **Space**. Press `<leader>` (space) and wait — LazyVim's which-key popup shows every available option live, better than memorizing this list. Below are your custom bindings only.

### Core (`lua/alex/core/keymaps.lua`)
| Key | Action |
|---|---|
| `<leader>nh` | Clear search highlights |
| `<leader>sv` / `<leader>sh` | Split window vertically/horizontally |
| `<leader>se` | Make splits equal size |
| `<leader>sx` | Close current split |
| `<leader>to` / `<leader>tx` | New tab / close tab |
| `<leader>tn` / `<leader>tp` | Next/previous tab |
| `<leader>tf` | Open current buffer in new tab |
| `Ctrl d` / `Ctrl u` | Half-page scroll down/up, centered |
| `Ctrl s` | Save file (custom notify) |
| `Ctrl i` (normal/insert/visual/select) | Save without formatting |
| `<leader>bk` | Delete all buffers except current |
| `<leader>bf` | Find buffers (Telescope) |

### Telescope (`lua/alex/plugins/telescope.lua`)
| Key | Action |
|---|---|
| `<leader>ff` | Find files in cwd |
| `<leader>fr` | Recent files |
| `<leader>fs` | Live grep (find string in cwd) |
| `<leader>fc` | Find string under cursor |
| `<leader>ft` | Find todos |
| `<leader>fk` | Find keymaps |

### Trouble (`lua/alex/plugins/trouble.lua`)
| Key | Action |
|---|---|
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `<leader>xt` | Todos in trouble |

### LazyGit (`lua/alex/plugins/lazygit.lua`)
| Key | Action |
|---|---|
| `<leader>lg` | Open LazyGit |

### Oil (`lua/alex/plugins/oil.lua`)
| Key | Action |
|---|---|
| `-` | Open Oil (parent dir) |
| `<leader>E` | Open Oil floating |
| `<leader>-` | Open Oil in current file's directory |
| Inside Oil: `Ctrl v` / `Ctrl h` / `Ctrl t` | Open entry in vsplit/split/tab |
| Inside Oil: `~` | cd to current oil dir (tab-scoped) |

### Harpoon2 (`lua/alex/plugins/harpoon2.lua`)
| Key | Action |
|---|---|
| `<leader>a` | Add file to Harpoon list |
| `<leader>1`-`<leader>4` | Go to Harpoon file 1-4 |
| `<leader>8` / `<leader>9` | Previous/next Harpoon file |
| `Ctrl e` | Open Harpoon window |
| `<leader>hm` | Harpoon quick menu |

### Gitsigns (`lua/alex/plugins/gitsigns.lua`)
| Key | Action |
|---|---|
| `<leader>hs` | Stage hunk (normal/visual) |
| `<leader>hr` | Reset hunk (normal/visual) |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hB` | Toggle line blame |
| `<leader>hd` | Diff this |
| `<leader>hD` | Diff this (~) |

### nvim-tree (`lua/alex/plugins/nvim-tree.lua`)
| Key | Action |
|---|---|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Toggle explorer on current file |
| `<leader>ec` | Collapse explorer |
| `<leader>er` | Refresh explorer |

### Maximizer (`lua/alex/plugins/maximizer.lua`)
| Key | Action |
|---|---|
| `<leader>sm` | Maximize/minimize current split |

### Copilot Chat (`lua/alex/plugins/copilot-chat.lua`)
| Key | Action |
|---|---|
| `<leader>cc` | Chat with Copilot using prompts (normal/visual) |
| `<leader>cr` | Open chat |
| `<leader>ch` | Chat history |
| `<leader>ce` | Explain code (visual) |
| `<leader>cf` | Fix code (visual) |
| `<leader>cg` | Check grammar (visual) |
| `<leader>cs` | Summarize code (visual) |
| `<leader>cm` | Generate commit message |
| `<leader>cmv` | Generate commit message for selection |
| `<leader>cx` | Reset chat |
| `<leader>cq` | Close chat |
| `<leader>cd` | Document code (visual) |

### Todo Comments (`lua/alex/plugins/todo-coments.lua`)
| Key | Action |
|---|---|
| `]t` / `[t` | Next/previous todo comment |

---
## fzf-git
Source: `~/.local/share/fzf-git/fzf-git.sh`, sourced in `~/.zshrc`. Fuzzy-pickers for git objects (works inside a git repo).

**Inside zellij, use `Ctrl x` then `g` then a letter as the prefix.** `Ctrl g` (fzf-git's own default) is claimed by zellij itself and never reaches the shell. An `Alt g` prefix was tried first but is *also* unsafe: zellij binds several bare `Alt <letter>` combos (`f`, `h`, `j`, `k`, `l`, `n`, `o`, `i`, `y`, `+`, `-`, `=`, `[`, `]`), so holding Alt through the whole combo (e.g. `Alt g` then `Alt f` without releasing Alt in between) fires zellij's `Alt f` (toggle floating panes) instead. `Ctrl x` is untouched by zellij, so this is collision-proof regardless of how the keys are physically pressed. Outside zellij, the original `Ctrl g` prefix still works too (all three are bound).

| Key (recommended, any context) | Key (plain terminal only) | Action |
|---|---|---|
| `Ctrl x g f` | `Ctrl g Ctrl f` / `Ctrl g f` | Fuzzy-pick files |
| `Ctrl x g b` | `Ctrl g Ctrl b` / `Ctrl g b` | Fuzzy-pick branches |
| `Ctrl x g t` | `Ctrl g Ctrl t` / `Ctrl g t` | Fuzzy-pick tags |
| `Ctrl x g r` | `Ctrl g Ctrl r` / `Ctrl g r` | Fuzzy-pick remotes |
| `Ctrl x g h` | `Ctrl g Ctrl h` / `Ctrl g h` | Fuzzy-pick commit hashes |
| `Ctrl x g s` | `Ctrl g Ctrl s` / `Ctrl g s` | Fuzzy-pick stashes |
| `Ctrl x g l` | `Ctrl g Ctrl l` / `Ctrl g l` | Fuzzy-pick reflogs |
| `Ctrl x g e` | `Ctrl g Ctrl e` / `Ctrl g e` | Fuzzy-pick each-ref |
| `Ctrl x g w` | `Ctrl g Ctrl w` / `Ctrl g w` | Fuzzy-pick worktrees |
| `Ctrl x g ?` | `Ctrl g ?` | Show this list of fzf-git bindings live |

---
## lazygit
Standard lazygit keybindings apply (no custom config found). Launch via `<leader>lg` in Neovim, or the `lazygit` command directly. Press `?` inside lazygit for its own live keybinding list.
