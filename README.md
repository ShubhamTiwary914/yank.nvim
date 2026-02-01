### yank.nvim - Yet Another Neovim Kustomization
Neovim customization for full IDE setup with linting, LSP, autocompletions, filetree, etc...


<details open>
<summary> Preview </summary>
<br>

<img width="1777" height="1119" alt="Screenshot_2026-02-01_22 58 01" src="https://github.com/user-attachments/assets/e2e599e3-02e4-4485-913e-a51fb124a03f" />

<img width="1784" height="1132" alt="Screenshot_2026-02-01_22 50 59" src="https://github.com/user-attachments/assets/2a8ed011-6a6f-44c4-a395-82d66aeb2b4e" />

<img width="760" height="390" alt="Screenshot_2026-02-01_22 57 33" src="https://github.com/user-attachments/assets/ae5adead-8120-42fa-a492-0e3c3026344d" />

</details>

---

### Installation

1. Backup existing Neovim config:
```bash
tar -czf nvim-backup_$(date '+%Y-%m-%d_%H.%M.%S').tar.gz ~/.config/nvim
```

2. Remove old config:
```bash
rm -rf ~/.config/nvim
```

3. Clone this repo as your new config:
```
git clone https://github.com/ShubhamTiwary914/yank.nvim.git ~/.config/nvim
```

4. Remove the git folder to avoid tracking updates:
```bash
rm -rf ~/.config/nvim/.git
```

Open Neovim and let the plugins install automatically.


### Plugins Overview

- Comment - Easy commenting of lines and blocks.
- LuaSnip - Snippet engine for Lua.
- nvim-cmp - Completion framework.
- friendly-snippets - Prebuilt snippets for multiple languages.
- cmp-path - File path completions.
- alpha - Startup dashboard.
- telescope - Fuzzy finder and navigation.
- treesitter - Syntax highlighting and parsing.
- mason - LSP/DAP installer
- nvim-lspconfig - LSP client configurations.
- gitsigns - Git indicators in the sign column.
- todo-comments - Highlight TODOs, FIXMEs, etc.
- catppuccin - Color theme
- barbar - Buffer tab management.


### Things to Add:
- [ ] DAP (debugging)
- [ ] Ai code assist (not annoying autocmp like cursor, just query on selected buffer in V-mode)
