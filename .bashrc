# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Editing modes
set -o vi

# Aliases
alias rm='rm -I'
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add ~/install to paths
for dir in $(ls -d $HOME/install/*); do
  if [ -d "$dir/bin" ]; then export PATH="$dir/bin:$PATH"; fi
  if [ -d "$dir/lib" ]; then 
    export LIBRARY_PATH="$dir/lib:$LIBRARY_PATH"
    export LD_LIBRARY_PATH="$dir/lib:$LD_LIBRARY_PATH"
  fi
  if [ -d "$dir/include" ]; then export CPATH="$dir/include:$CPATH"; fi
done
