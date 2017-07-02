# vim-colors-cherryblossom

This colorscheme is under development.
You can use it as prototype so far.

## Configuration
### Terminal Italics
If your terminal application supports italics, or you use gvim, you can enable this feature to use italics syntax highlighting, such as comments.

```vim
let g:terminal_italics = 1
```

### Switch StatusLine Background Color in Insert mode
If you prefer to switch StatusLine coloring in insert mode, you can opt-in to let Vim automatically switch the coloring.
The default color of StatusLine is green, and with pink in insert mode with this option.

```vim
let g:switch_statusline_bg_in_insert = 1
```

### Use Undercurl in Spell Highlighting (GUI only)
In GUI Vim, you can use the undercurl highlight feature.
This applies to only Spell syntax.

```vim
let g:spell_undercurl = 1
```
