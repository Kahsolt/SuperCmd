# Envvar
export WINHOME=/c/Users/Kahsolt
export LINUX_HOME=$WINHOME/Documents/Configs/oh-my-linux/home/kahsolt
ZSH_ALIASES=$LINUX_HOME/.zsh_aliases
TMUX_CONF=$LINUX_HOME/.tmux.conf

# Startup
[ -f $ZSH_ALIASES ] && source $ZSH_ALIASES
[ -f $TMUX_CONF ] && \cp -fu $TMUX_CONF $HOME

# For windows
alias win='cd $WINHOME'
alias fm=explorer.exe
alias npp='/c/Program\ Files/Notepad++/notepad++.exe'

# Aliases
alias resource='source $HOME/.bashrc'
alias realias='nano $HOME/.bash_aliases && resource'
alias pm=pacman

function cd() {
  pushd "$([ "$1" ] && echo $1 || echo $HOME)" > /dev/nul
}
function pms() {
  pacman -Ss $1 | grep mingw-w64-x86_64
}
function pmi() {
  [ $1 ] && pacman -S mingw-w64-x86_64-$1
}
function pmu() {
  [ $1 ] && pacman -Rnus mingw-w64-x86_64-$1
}
