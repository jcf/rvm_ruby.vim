# rvm_ruby.vim

Until MacVim supports RVM I've written this quick little plugin that provides a
`Ruby` command.

Everything gets routed to the `rvm` directory in your `$HOME` folder. It
doesn't support alternate `rvm` directories!

## Installation

### Using submodules

    cd ~/.vim
    git submodule add git://github.com/jcf/rvm_ruby.vim.git vim/bundle/rvm_ruby.vim

### Alternatively…

You can use the more traditional installation methods. Just dump the
rvm_ruby.vim file in to plugin.

## Usage

Pick a version of Ruby and open a Ruby file in MacVim:

    rvm use 1.9.2-p0
    mvim script.rb

Use the Ruby ex command:

    :Ruby -v

And you'll get some nice output:

    :!$HOME/.rvm/rubies/$RUBY_VERSION/bin/ruby -v
    [No write since last change]
    ruby 1.9.2p0 (2010-08-18 revision 29036) [x86_64-darwin10.4.0]
