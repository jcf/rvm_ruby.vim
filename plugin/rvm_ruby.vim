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
  let g:rvm_bin = "$HOME/.rvm/rubies/$RUBY_VERSION/bin/"
else
  let g:rvm_bin = "$HOME/.rvm/rubies/default/bin/"
endif

function s:RVMRuby(...)
  let s:arg_string = join(a:000, " ")
  exe "!" . g:rvm_bin . "ruby " . s:arg_string
endfunction

function s:RVMGem(...)
  let s:arg_string = join(a:000, " ")
  exe "!" . g:rvm_bin . "gem " . s:arg_string
endfunction

command! -nargs=+ -complete=file Ruby :call <SID>RVMRuby(<f-args>)
command! -nargs=+ -complete=file Gem :call <SID>RVMGem(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set sw=2 sts=2:
