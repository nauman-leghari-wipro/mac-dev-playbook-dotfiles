#!/usr/bin/env bash

#
# .bash_profile
#
# @author Karl Hepworth
# @see .inputrc
#

# Nicer prompt.
export PS1=" \D{%I:%M %p}:\w $ "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$HOME/.composer/vendor/bin:$PATH

# Flush DNS cache (See: http://support.apple.com/kb/ht5343).
alias flush-dns='sudo killall -HUP mDNSResponder'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

# Use brew-installed PHP binaries.
export PATH="$brew_prefix/opt/php56/bin:$PATH"

# Vagrant configuration.
 export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Disable cowsay in Ansible.
export ANSIBLE_NOCOWS=1

shopt -s extdebug
