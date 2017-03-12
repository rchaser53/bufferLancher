function! Poyo()
  tabnew | r !echo ~
  call search('\w')
  let l:abc = getline('.')
  exec ":vimgrep 'a' ".l:abc."/.vimrc"
endfunction
