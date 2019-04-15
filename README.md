# vim-colors-cherryblossom

:cherry_blossom: light (dark) colorscheme for vim

Note: This colorscheme is developed mainly for light background.


## Installation

### dein.vim

In your `dein.toml`:

```toml
[[plugins]]
repo = "float168/vim-colors-cherryblossom"
```

or call function in your `.vimrc` (`init.nvim`)

```vim
call dein#add("float168/vim-colors-cherryblossom")
```

### Vundle

```vim
Plugin "float168/vim-colors-cherryblossom"
```

### vim-plug

```vim
Plug "float168/vim-colors-cherryblossom"
```

### vim-pathogen

```sh
$ cd ~/.vim/bundle && git clone https://github.com/float168/vim-colors-cherryblossom
```

### Manual installation

Move `cherryblossom.vim` to your `.vim/colors` (`.config/nvim/colors`) directory.

```sh
$ git clone https://github.com/float168/vim-colors-cherryblossom
$ mv vim-colors-cherryblossom/colors/cherryblossom.vim ~/.vim/colors/
```


## Usage

```vim
syntax on
set background=light
"set background=dark
colorscheme cherryblossom
```

Using in light background is recommend.
If you prefer dark background, use `set background=dark` instead.


## Configuration

You can configure some features for colorscheme.
These options should be put above `colorscheme cherryblossom` statement.

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

