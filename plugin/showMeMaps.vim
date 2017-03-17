if !exists('g:keyMappingPaths')
  let g:keyMappingPaths = []
endif

if len(g:keyMappingPaths) == 0
   call add(g:keyMappingPaths, $HOME.'/.vimrc')
endif

function! s:GrepMap(path)
  if !empty(glob(a:path))
    exec 'vimgrep /\zs\w\(nore\)\?map\ze/j '.a:path
    return
  endif

  highlight link txtError Error
  echohl txtError | echo "set .vimrc path to .vimrc_path" | echohl None
endfunction

function! g:ShowMeMaps()
  for item in g:keyMappingPaths
    call s:GrepMap(item)
  endfor
endfunction
