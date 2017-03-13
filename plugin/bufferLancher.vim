function! Poyo(word)
  if !empty(glob($HOME."/.vimrc2"))
    exec ":vimgrep /a:word/j ".$HOME."/.vimrc"
  endif

  highlight link txtError Error
  echohl txtError | echo "nyan" | echohl None
endfunction
