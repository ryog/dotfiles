let g:dein#enable_notification   = 1
let g:dein#install_message_type  = 'none'
let g:dein#install_progress_type = 'title'

let s:dein_cache_dir = g:cache_home  . '/dein'
let s:dein_toml      = g:config_home . '/nvim/dein.toml'
let s:deinlazy_toml  = g:config_home . '/nvim/deinlazy.toml'
let s:deinft_toml    = g:config_home . '/nvim/deinft.toml'

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/shougo/dein.vim'

  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif

  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)
  call dein#load_toml(s:dein_toml,     {'lazy': 0})
  call dein#load_toml(s:deinlazy_toml, {'lazy': 1})
  call dein#load_toml(s:deinft_toml,   {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

