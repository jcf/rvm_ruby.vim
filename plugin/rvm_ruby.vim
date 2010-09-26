" plugin/rvm_ruby.vim
" Author:   James Conroy-Finn <james@logi.cl>
" License:  MIT License

" Install this file as plugin/rvm_ruby.vim.

" ============================================================================

if &cp || exists("g:rvm_ruby_loaded") && g:rvm_ruby_loaded
  finish
endif
let g:rvm_ruby_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

if strlen($RUBY_VERSION)
  let g:rvm_ruby = "$HOME/.rvm/rubies/$RUBY_VERSION/bin/ruby"
else
  let g:rvm_ruby = "$HOME/.rvm/rubies/default/bin/ruby"
endif

function s:RVMRuby(...)
  let s:arg_string = join(a:000, " ")
  exe "!" . g:rvm_ruby . " " . s:arg_string
endfunction

command! -nargs=+ -complete=file Ruby :call <SID>RVMRuby(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set sw=2 sts=2:
