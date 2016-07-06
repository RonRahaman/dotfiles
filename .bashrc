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

# Prompt coloring
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Add ~/install to paths
pkg_dirs=(${HOME}/install/bzip2-1.0.3 ${HOME}/install/mpich-3.2-intel-14.0.3/) # Just an example
for dir in "${pkg_dirs[@]}"; do
  if [ -d "${dir}/bin"  ]; then
    export PATH="${dir}/bin:${PATH}"
  fi
  if [ -d "${dir}/lib"  ]; then
    export LIBRARY_PATH="${dir}/lib:${LIBRARY_PATH}"
    export LD_RUN_PATH="${dir}/lib:${LD_RUN_PATH}"
    export LDFLAGS="-L${dir}/lib ${LDFLAGS}"
    #for libfile in $(ls ${dir}/lib/*.a 2>/dev/null); do
    #libname=$libfile
    #libname=${libname##*lib}
    #libname=${libname%.a}
    #export LIBS="-l${libname} ${LIBS}"
    #done
  fi
  if [ -d "${dir}/include"  ]; then
    export CPATH="${dir}/include:$CPATH"
    export CFLAGS="-I${dir}/include $CFLAGS"
    export CXXFLAGS="-I${dir}/include $CXXFLAGS"
  fi
  if [ -d "${dir}/man"  ]; then
    export MANPATH="${dir}/man:${MANPATH}"
  fi
done
