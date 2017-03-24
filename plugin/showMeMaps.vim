if !exists('g:keyMappingPaths')
  let g:keyMappingPaths = []
endif

if len(g:keyMappingPaths) == 0
   call add(g:keyMappingPaths, $HOME.'/.vimrc')
endif

if !exists('g:mapMark')
  let g:mapMark = ''
endif

function! g:ShowMeMaps()
  let l:errorFlag = 'false'

  for item in g:keyMappingPaths
    if empty(glob(item))
      highlight link txtError Error
      echohl txtError | echo item." is not found" | echohl None

      unlet l:errorFlag
      let l:errorFlag = 'true'
    endif

    if l:errorFlag == 'true'
      return
    endif
  endfor

  let l:joinPaths = join(g:keyMappingPaths, ' ')
  exec 'vimgrep /\zs\w\(nore\)\?map\(.\+\)'.g:mapMark.'\ze/j '.l:joinPaths
endfunction
