if exists('g:keyMappingPaths') && len(g:keyMappingPaths) == 0
  finish
endif

function! s:GrepMap(path)
  if !empty(glob(a:path))
    vimgrep /\zs\w\(nore\)\?map\ze/j $HOME/.vimrc
    return
  endif

  highlight link txtError Error
  echohl txtError | echo "set .vimrc path to .vimrc_path" | echohl None
endfunction

function! g:GetMapCommand()
  for item in g:keyMappingPaths
    call s:GrepMap(item)
  endfor
endfunction
