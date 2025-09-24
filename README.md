# Remote-Friendly Vim Python Setup

This repository provides a minimal yet productive Vim configuration for Python development on a remote server. It relies on [`vim-plug`](https://github.com/junegunn/vim-plug) to manage plugins and focuses on fast navigation, linting, and formatting.

## Getting Started
1. Install **vim-plug** on the remote host following the instructions in its README.
2. Copy the provided `.vimrc` to your home directory.
3. Launch Vim and run `:PlugInstall` to download plugins. The FZF plugin will compile itself automatically.
4. Install the external tools used by ALE:
   ```bash
   pip install black isort flake8 mypy pylint
   ```
   Install [`fzf`](https://github.com/junegunn/fzf) if you want fuzzy file finding outside of Vim as well.

> **Tip:** When connecting through SSH, ensure your terminal supports true color if you want the Gruvbox theme to display at full fidelity. Otherwise Vim will gracefully fall back to 256-color mode.

## Leader Key
- The leader key is set to **Space**. All custom shortcuts below use `Space` as the prefix.

## Plugin Shortcuts & Usage

### NERDTree — File Explorer
- `Space + e` &nbsp; Toggle the sidebar.
- In the tree: `o` to open files/directories, `t` to open in a new tab, `m` for filesystem menu.

### FZF — Fuzzy Finder
- `Space + f` &nbsp; Search files with an instant fuzzy matcher.
- `:Rg <pattern>` &nbsp; (requires ripgrep) Search within files using FZF’s interface.

### vim-commentary — Quick Commenting
- `Space + /` &nbsp; Toggle comments on the current line or a selected block.
- `gcc` &nbsp; Comment/uncomment the current line.
- `gc` + motion &nbsp; Comment/uncomment a movement (e.g. `gcap` for a paragraph).

### vim-surround — Edit Surrounding Characters
- `cs"'` &nbsp; Change surrounding `"` to `'`.
- `ds"` &nbsp; Delete surrounding `"`.
- `ysiw]` &nbsp; Wrap the current word in `[]`.
- `S)` in visual mode &nbsp; Wrap a selection in parentheses.

### vim-fugitive — Git Integration
- `Space + gb` &nbsp; Show blame information for the current line.
- `:Git status` &nbsp; View repository status.
- `:Git add %` &nbsp; Stage the current file.
- `:Git commit` / `:Git push` &nbsp; Commit or push changes.
- `:Gdiffsplit` &nbsp; Open a diff split for the current file.

### ALE — Linting & Formatting
- `Space + n` / `Space + p` &nbsp; Jump to the next/previous linting issue.
- `Space + af` &nbsp; Run `ALEFix` manually (runs `black` + `isort`).
- Automatically fixes Python files on save and shows lint diagnostics in the sign column.
- Uses `flake8`, `mypy`, and `pylint` if they are installed. Configure paths via `:h ale-python` if your tools live in a virtualenv.

### vim-airline — Status Line
- Displays file info, Git branch, ALE diagnostics, and cursor position at a glance.
- Integrates with ALE automatically; no manual shortcuts required.

### Gruvbox — Colorscheme
- Enabled by default with a dark background.
- Toggle light mode temporarily with `:set background=light` if desired.

## Quality-of-Life Settings
- Relative line numbers and `scrolloff` provide context around the cursor.
- Persistent sign column prevents window shifting when ALE reports diagnostics.
- Automatic indentation and `expandtab` honor Python’s formatting expectations.
- `colorcolumn=88` in Python buffers highlights the recommended line length for Black.
- Clipboard integration is enabled when the remote Vim build supports it.

## Updating Plugins
Run `:PlugUpdate` periodically to stay current. Use `:PlugClean` to remove plugins that are no longer configured.

