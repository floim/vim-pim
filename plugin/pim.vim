" File:         pim.vim
" Description:  Easy code sharing to Pim
" Maintainer:   Benjie Gillam <vim@jemjie.com>
" Version:      0.1.2
" Language:     Vim script
" Last Change:  2012 May 22

nnoremap <leader>py :call PimYank()<CR>
vnoremap <leader>py :call PimYankVisual()<CR>

function! PimYank() range
  let firstLine = a:firstline
  let lastLine = a:lastline
  let linenumber = firstLine
  let filename = expand('%')
  if filename[0] is '/'
    let filename = expand('%:t')
  endif
  try
    let p_save = @p
    let addNewline = ""
    call setreg('p','')
    for linenum in range(firstLine, lastLine)
      call setreg('P',getline(linenum) . "\n")
    endfor
    call setreg('p', '```' . filename . ':' . linenumber . "\n" . @p . addNewline . '```')
    let @*=@p
  finally
    let @p = p_save
  endtry
endfunction

function! PimYankVisual()
  let linenumber = line("'<")
  let filename = expand('%')
  if filename[0] is '/'
    let filename = expand('%:t')
  let vimmode = visualmode()
  try
    let p_save = @p
    let addNewline = "\n"
    normal! gv"py
    if vimmode == 'V'
      let addNewline = ""
    endif
    call setreg('p', '```' . filename . ':' . linenumber . "\n" . @p . addNewline . '```')
    let @*=@p
  finally
    let @p = p_save
  endtry
endfunction
