" JustWrite
"
" A Vim mode for writers.
"
" A write-only editor, no editing, just write.
"
" Features:
" Starts insert mode at startup
" Stays in insert mode until exit
" Only add text, no deletes, navigation, etc.. (gvim can scroll window though)
" All modifier combinations (C/S/M/D/T) mapped to prevent edits
" turn on wrap and linebreak
" turn off automatic indents (unable to delete them back)
" Go to end of buffer when enabled (adds a space - is there another way ?)
" Go to end of buffer when filetype *.jw.txt loaded
" Enable JustWrite mode for filetype *.jw.txt

" Todo:
" gvim (+macvim?) window scroll moves cursor - prevent or overcome ?
" Hide / Darken previous lines ? - gradient ?

autocmd BufNewFile,BufRead *.jw.txt set filetype=JustWrite
autocmd FileType JustWrite call JustWriteModeOn()

function JustWriteModeOn()
  setlocal wrap
  setlocal linebreak
  setlocal nocindent
  setlocal nosmartindent
  setlocal noautoindent
  call DisableInsertModeMappings()
  setlocal insertmode
  call GotoEndOfFile()
endfunction

function GotoEndOfFile()
  " cannot position cursor *after* last column
  " positioning *at* last column puts cursor *before* last character
  " all motion keys have been remapped to <Nop>
  " this is an awful hack, there must be a better way
  " maybe temporarily remap motion keys for use by feedkeys() ?
  " or use 'normal a' ?
  " and/or don't use 'set insertmode' ?
  let last_line = line( '$' )
  let old_text = getline( last_line )
  let new_text = old_text . ' '
  let last_col = len( new_text )
  call setline( last_line, new_text )
  call cursor( last_line, last_col )
endfunction

function DisableInsertModeMappings()

  let debug = 0

  " omit I because C-I = <Tab>
  " omit J because C-J = <NL>
  " omit M because C-M = <NL>
  " omit | because it cannot be mapped
  let character_keys  = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
                        \ "A", "B", "C", "D", "E", "F", "G", "H", "K", "L", "N", "O",
                        \ "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 
                        \ "~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+",
                        \ "{", "}", "[", "]", "\\", ";", ":", "\"", "'", "<", ">", ",", ".", "/", "?" ]

  let deletion_keys   = [ "BS", "Del" ]

  let navigation_keys = [ "Left", "Right", "Up", "Down", "Home", "End", "PageUp", "PageDown" ]

  let function_keys   = [ "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12" ]
  
  let misc_keys       = [ "Esc", "Insert" ]

  let mouse_actions   = [ "LeftMouse", "RightMouse", "MiddleMouse",
                        \ "ScrollWheelDown", "ScrollWheelUp", "ScrollWheelLeft", "ScrollWheelRight",
                        \ "LeftRelease", "RightRelease", "MiddleRelease",
                        \ "LeftDrag", "RightDrag", "MiddleDrag",
                        \ "2-LeftMouse", "2-RightMouse", "3-LeftMouse", "3-RightMouse", "4-LeftMouse", "4-RightMouse",
                        \ "X1Mouse", "X2Mouse", "X1Release", "X2Release", "X1Drag", "X2Drag" ]

  " disable non character keys that could be used without modifiers
  for key in deletion_keys + navigation_keys + function_keys + misc_keys + mouse_actions
    if debug | echo key | endif
    execute "inoremap <buffer> <" . key . "> <Nop>" 
  endfor

  " disable non character keys that could be used with SHIFT
  for key in deletion_keys + navigation_keys + function_keys + misc_keys + mouse_actions
    if debug | echo "S-" . key  | endif
    execute "inoremap <buffer> <S-" . key . "> <Nop>" 
  endfor

  " other modifiers CTRL, META(ALT), maybe Mac command key
  let modifiers = [ "C-", "M-" ]
  if has("gui_gtk") | call add( modifiers, "T-" ) | endif
  if has("gui_mac") | call add( modifiers, "D-" ) | endif

  " disable single modifier (except SHIFT) and all keys
  for mod in modifiers
    for key in character_keys + deletion_keys + navigation_keys + function_keys + misc_keys + mouse_actions
      if debug | echo mod . key | endif
      execute "inoremap <buffer> <" . mod . key . "> <Nop>" 
    endfor
  endfor

  let modifier_combinations = [ "C-M-", "C-S-", "M-S-", "C-M-S-" ]

  if has("gui_gtk") | call extend( modifier_combinations, [ "C-T-", "M-T-", "S-T-", "C-M-T-", "C-S-T-", "M-S-T-", "C-S-M-T-" ] ) | endif
  if has("gui_mac") | call extend( modifier_combinations, [ "C-D-", "M-D-", "S-D-", "C-M-D-", "C-S-D-", "M-S-D-", "C-S-M-D-" ] ) | endif 
  
  " disable modifier combinations and keys
  for mod_combination in modifier_combinations
    for key in character_keys + deletion_keys + navigation_keys + function_keys + misc_keys + mouse_actions
      if debug | echo mod_combination . key | endif
      execute "inoremap <buffer> <" . mod_combination . key . "> <Nop>" 
    endfor
  endfor
        
endfunction

