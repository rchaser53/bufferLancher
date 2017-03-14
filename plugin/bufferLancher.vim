function! g:GetMapCommand()
  if !empty(glob($HOME."/.vimrc"))
    vimgrep /\zs\w\(nore\)\?map\ze/j $HOME/.vimrc
    return
  endif

  highlight link txtError Error
  echohl txtError | echo "set .vimrc path to .vimrc_path" | echohl None
endfunction
