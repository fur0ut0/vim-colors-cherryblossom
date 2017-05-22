" Vim Colorscheme
" Name:     cherryblossom.vim
" Author:   Luo Boming
" Version:  0.1
" License:  The MIT Licence

"{{{ Pre-setting
let g:colors_name = "<sfile>:t:r"

hi clear
if exists("syntax_on")
    syntax reset
endif

if ! exists("g:terminal_italics")
    let g:terminal_italics = 0
endif

if ! exists("g:switch_statusline_bg_in_insert")
    let g:switch_statusline_bg_in_insert = 0
endif

"}}}
"{{{ Color Palette
" Color Entity
let s:black             = { "gui": "#171717", "cterm": "16"  }
let s:white             = { "gui": "#EAE8E7", "cterm": "231" }

let s:gray              = { "gui": "#979391", "cterm": "247" }

let s:green             = { "gui": "#30B536", "cterm": "34"  }
let s:pink              = { "gui": "#D36DD3", "cterm": "170" }
let s:orange            = { "gui": "#FC923F", "cterm": "208" }
let s:red               = { "gui": "#EB5A7C", "cterm": "204" }
let s:purple            = { "gui": "#B586E7", "cterm": "141" }
let s:blue              = { "gui": "#255DE7", "cterm": "27"  }
let s:ultramarine       = { "gui": "#229EC0", "cterm": "38"  }
let s:skyblue           = { "gui": "#34D0F1", "cterm": "45"  }

let s:white_pink        = { "gui": "#FEF7FE", "cterm": "231" }
let s:black_green       = { "gui": "#053703", "cterm": "235" }

let s:light_gray        = { "gui": "#E1DCDA", "cterm": "255" }
let s:light_green       = { "gui": "#B7EFA5", "cterm": "157" }
let s:light_pink        = { "gui": "#FEDCFE", "cterm": "225" }
let s:light_yellow      = { "gui": "#EDE682", "cterm": "228" }
let s:light_red         = { "gui": "#EB5A7C", "cterm": "204" }

let s:dark_gray         = { "gui": "#4D4A48", "cterm": "239" }
let s:dark_green        = { "gui": "#09570A", "cterm": "22"  }
let s:dark_yellow       = { "gui": "#BC922B", "cterm": "3"   }
let s:dark_pink         = { "gui": "#B365A2", "cterm": "133" }
let s:dark_brown        = { "gui": "#845D18", "cterm": "94"  }

" Color Alias
if &background == "light"
    let s:norm          = s:black
    let s:bg            = s:white_pink
    let s:bg_subtle     = s:light_pink
    let s:green_fg      = s:green
    let s:yellow_fg     = s:dark_yellow
    let s:pink_fg       = s:dark_pink
    let s:blue_fg       = s:ultramarine
    let s:gray_bg       = s:light_gray
    let s:green_bg      = s:light_green
    let s:yellow_bg     = s:light_yellow
    let s:pink_bg       = s:light_pink
    let s:blue_bg       = s:skyblue
endif

if &background == "dark"
    let s:norm          = s:white
    let s:bg            = s:black_green
    let s:bg_subtle     = s:dark_green
    let s:green_fg      = s:light_green
    let s:yellow_fg     = s:light_yellow
    let s:pink_fg       = s:light_pink
    let s:blue_fg       = s:skyblue
    let s:gray_bg       = s:dark_gray
    let s:green_bg      = s:green
    let s:yellow_bg     = s:dark_yellow
    let s:pink_bg       = s:pink
    let s:blue_bg       = s:ultramarine
endif
"}}}
"{{{ Highlight Function
" shamelessly stolen from pencil: https://github.com/reedes/vim-colors-pencil
function! s:hi(group, style)
    if ! g:terminal_italics && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
        unlet a:style.cterm
    endif
    execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
        \ "term="    (has_key(a:style, "term")  ? a:style.term     : "NONE")
endfunction

"}}}
"{{{ Common Highlighting
call s:hi("Normal",         {"fg": s:norm, "bg": s:bg})
call s:hi("Cursor",         {})
call s:hi("Comment",        {"fg": s:skyblue,                   "gui": "italic",    "cterm": "italic",  "term": "italic"})

call s:hi("Constant",       {"fg": s:pink_fg})
hi! link String             Constant
hi! link Character          Constant
hi! link Number             Constant
hi! link Boolean            Constant
hi! link Float              Constant

call s:hi("Identifier",     {"fg": s:red})
hi! link Function           Identifier

call s:hi("Statement",      {"fg": s:green_fg})
hi! link Conditonal         Statement
hi! link Repeat             Statement
hi! link Label              Statement
hi! link Operator           Statement
hi! link Keyword            Statement
hi! link Exception          Statement

call s:hi("PreProc",        {"fg": s:pink_fg})
hi! link Include            PreProc
hi! link Define             PreProc
hi! link Macro              PreProc
hi! link PreCondit          PreProc

call s:hi("Type",           {"fg": s:yellow_fg})
hi! link StorageClass       Type
hi! link Structure          Type
hi! link Typedef            Type

call s:hi("Special",        {"fg": s:orange})
hi! link SpecialChar        Special
hi! link Tag                Special
hi! link Delimiter          Special
hi! link SpecialComment     Special
hi! link Debug              Special

call s:hi("Underlined",      {"gui": "underline", "cterm": "underline"})
call s:hi("Ignore",          {"fg": s:bg_subtle})
call s:hi("Error",           {"bg": s:red , "gui": "bold"     , "cterm": "bold"     })
call s:hi("Todo",            {"bg": s:yellow_bg, "gui": "bold"     , "cterm": "bold"     })

"}}}
"{{{ Semi-Common Highlighting
call s:hi("SpecialKey",     {"fg": s:blue, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("NonText",        {"fg": s:blue, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("Directory",      {"fg": s:blue_fg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("ErrorMsg",       {"fg": s:red, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("IncSearch",      {"gui": "reverse", "cterm": "reverse", "term": "reverse"})
call s:hi("Search",         {"fg": s:norm, "bg": s:pink_bg})
call s:hi("MoreMsg",        {"fg": s:pink_fg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("ModeMsg",        {"fg": s:pink_fg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("LineNr",         {"fg": s:gray})
call s:hi("CursorLineNr",   {"fg": s:pink_fg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("Question",       {"fg": s:purple, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("StatusLine",     {"fg": s:norm, "bg": s:green_bg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("StatusLineNC",   {"fg": s:norm, "bg": s:gray_bg})
call s:hi("Conceal",        {"fg": s:yellow_fg})
call s:hi("VertSplit",      {"gui": "reverse", "cterm": "reverse", "term": "reverse"})
call s:hi("Title",          {"fg": s:pink_fg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("Visual",         {"bg": s:bg, "gui": "reverse", "cterm": "reverse", "term": "reverse"})
call s:hi("VisualNOS",      {"bg": s:bg, "gui": "bold,underline", "cterm": "bold,underline", "term": "bold,underline"})
call s:hi("WarningMsg",     {"fg": s:orange, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("WildMenu",       {"fg": s:norm, "bg": s:blue_bg})
call s:hi("Folded",         {"fg": s:green_fg, "bg": s:gray_bg})
call s:hi("FoldColumn",     {"fg": s:green_fg, "bg": s:gray_bg})
call s:hi("DiffAdd",        {"bg": s:green_fg})
call s:hi("DiffChange",     {"bg": s:orange})
call s:hi("DiffDelete",     {"bg": s:red})
call s:hi("DiffText",       {"bg": s:blue_fg, "gui": "bold", "cterm": "bold", "term": "bold"})
call s:hi("SignColumn",     {"fg": s:green_fg, "bg": s:gray})
call s:hi("SpellBad",       {"bg": s:red})
call s:hi("SpellCap",       {"bg": s:yellow_fg})
call s:hi("SpellRare",      {"bg": s:pink_fg})
call s:hi("SpellLocal",     {"bg": s:green_fg})
call s:hi("Pmenu",          {"bg": s:gray_bg})
call s:hi("PmenuSel",       {"bg": s:pink_bg})
call s:hi("PmenuSbar",      {})
call s:hi("PmenuThumb",     {})
call s:hi("TabLine",        {})
call s:hi("TabLineSel",     {})
call s:hi("TabLineFill",    {})
call s:hi("CursorColumn",   {"bg": s:yellow_fg})
call s:hi("CursorLine",     {})
call s:hi("ColorColumn",    {"bg": s:bg_subtle})
call s:hi("MatchParen",     {"fg": s:pink_fg, "gui": "underline", "cterm": "underline"})
call s:hi("qfLineNr",       {})

"}}}
"{{{ Switching StatusLine bg
function! s:changebg(group, color)
    execute "highlight" a:group "guibg=" a:color.gui "ctermbg=" a:color.cterm
endfunction

if g:switch_statusline_bg_in_insert
    "" Change Color when entering Insert Mode
    autocmd InsertEnter * call s:changebg("StatusLine", s:pink_bg)
    "" Revert Color to default when leaving Insert Mode
    autocmd InsertLeave * call s:changebg("StatusLine", s:green_bg)
endif

"}}}
" vim: set foldmethod=marker:

