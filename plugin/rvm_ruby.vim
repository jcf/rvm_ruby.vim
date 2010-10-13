" Author:   James Conroy-Finn <james@logi.cl>
" License:  MIT License

if &cp || exists("g:rvm_ruby_loaded") && g:rvm_ruby_loaded
  finish
endif
let g:rvm_ruby_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists("g:rvm_path")
  let g:rvm_path = "$HOME/.rvm"
endif

if strlen($RUBY_VERSION)
  let s:rvm_bin = g:rvm_path . "/rubies/$RUBY_VERSION/bin/"
else
  let s:rvm_bin = g:rvm_path . "/rubies/default/bin/"
endif

function! s:RVMSystemCall(command, ...)
  let s:arg_string = join(a:1, " ")
  return system(s:rvm_bin . a:command . " " . s:arg_string)
endfunction

function! s:RVMRuby(...)
  let s:result = s:RVMSystemCall("ruby", a:000)
  echo s:result
endfunction

function! s:RVMGem(...)
  let s:result = s:RVMSystemCall("gem", a:000)
  echo s:result
endfunction

command! -nargs=+ -complete=file Ruby :call <SID>RVMRuby(<f-args>)
command! -nargs=+ -complete=file Gem :call <SID>RVMGem(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set sw=2 sts=2:
