" :w!! - Sudo write
cmap w!! w !sudo tee > /dev/null %


" Restore last cursor position
augroup RememberCursorPosition
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \|  exe "normal! g`\""
    \|endif
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
augroup END


" Ripgrep command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" Quit if NERDTree is last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Terminal utilities
augroup TerminalEnter
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup END

" Toggle bottom terminal window
let g:term_buf = 0
let g:term_win = 0

function! ToggleTerminal()
  if win_gotoid(g:term_win)
    hide
  else
    botright new
    exec 'resize 7'
    try
      exec 'buffer ' . g:term_buf
    catch
      call termopen($SHELL, {'detach': 0})
      let g:term_buf = bufnr('')
    endtry
    startinsert!
    let g:term_win = win_getid()
  endif
endfunction

" Run command in top terminal window
let g:cmd_win = 0

function! RunCommand(command)
  if win_gotoid(g:cmd_win)
    quit!
  endif

  topleft new
  exec 'resize 5'
  call termopen(a:command)
  startinsert!
  let g:cmd_win = win_getid()
endfunction

function! RunCommandOnCurrentFile(command)
  let l:file = expand('%:p')
  call RunCommand(a:command . ' ' . l:file)
endfunction

" vim: ts=2 sts=2 sw=2 expandtab
