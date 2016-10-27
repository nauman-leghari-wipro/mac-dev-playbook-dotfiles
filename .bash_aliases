# Exports

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export TOOLS_HOME=$HOME/tools
export WORK_HOME=$HOME/workspace

# Aliases

alias ll='ls -lh -G'
alias git_sort_by_checkins="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) %(committerdate:short) %(authorname)'"

# Aliases for projects
alias work="cd ~/workspace"
alias dircopy="pwd | tr -d '\n' | pbcopy"
alias catfile="cat << EOF > "
alias gl="git l"

alias JAVA7="JAVA_HOME=`/usr/libexec/java_home -v 1.7`"
alias JAVA8="JAVA_HOME=`/usr/libexec/java_home -v 1.8`"

alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

alias dm=docker-machine

# Functions

function tardir() {
  DIR=${1}
  tar zcvf $DIR.tar.gz $DIR
}

##
# Quickly starts a webserver from the current directory.
#
# Thanks to:
# http://superuser.com/questions/52483/terminal-tips-and-tricks-for-mac-os-x
#
# @param [optional, Integer] bind port number, default 8000
function serve() {
  $(which python) -m SimpleHTTPServer ${1:-8000}
}

function f() { find . -iname "*$1*" ${@:2} }
function fopen() { find . -iname "*$1*" ${@:2} | fzf | xargs sub }
function r() { ack "$1" ${@:2} -R . }
function psgrep() { pstree  | ack -v ack | ack "$@" }
function fname() { find . -iname "*$@*"; }
function fnote() { ack "$@" ~/notes.txt }
function pskill() { ps -ef | ack "$@" | awk '{print "kill -9 "$2}' | sh }
function previewman { man -t "$@" | open -f -a /Applications/Preview.app }
function genmail { echo -n 'customer-'$(date +%s)'@example.com' | pbcopy }
function h() { history | ack "$@" }

opendocker()
{
  open http://"$(docker-machine ip default):$1"
}

# Visual Studio Code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

mcd() { mkdir -vp $1 && cd $1 }

#
# Docker exports
echo "Setting docker env"
eval $(docker-machine env default)

# Add certificate to agent
ssh-add ~/.ssh/id_rsa
