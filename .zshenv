# vim:set ft=zsh foldmethod=marker:

# Start profiling
# zmodload zsh/zprof && zprof

# ZSH_HOME
export ZSH_HOME=${HOME}/.zsh

# Local
export LANG='ja_JP.UTF-8'
export LC_CTYPE="ja_JP.UTF-8"

# fpath
typeset -U fpath
fpath=(
  ${ZSH_HOME}/site-functions
  ${fpath}
)

# system path
typeset -U path
path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/bin(N-/)
  /bin(N-/)
  /opt/homebrew/bin(N-/)
  $path
)

# coreutils
if type brew >> /dev/null 2>&1; then
  path=(
    $(brew --prefix coreutils)/libexec/gnubin(N-/)
    $path
  )
fi

# heroku
# if type heroku >> /dev/null 2>&1; then
#   path=(
#     /usr/local/heroku/bin(N-/)
#     $path
#   )
# fi

# LL Path
path=(
  ${HOME}/.rbenv/shims(N-/)        # Rbenv
  ${HOME}/.rbenv/bin(N-/)          # Rbenv
  ${HOME}/.plenv/bin(N-/)          # Plenv
  ${HOME}/.pyenv/bin(N-/)          # Pyenv
  $path
)

# User-specific paths
path=(
  ${HOME}/src/github.com/yuuki1/opstools/bin(N-/)
  ${HOME}/bin(N-/)
  ${HOME}/local/bin(N-/)
  $path
)

# SUDO_PATH
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=(
  /usr/local/sbin(N-/)
  /usr/sbin(N-/)
  /sbin(N-/)
)

# MANPATH
typeset -U manpath
manpath=(
  ${HOME}/local/share/man(N-/)
  /usr/local/share/man(N-/)
  /usr/share/man(N-/)
)

export LANG=ja_JP.UTF-8

export EDITOR="vim"

# PAGER
if type lv > /dev/null 2>&1; then
  export PAGER="lv"
else
  export PAGER="less"
fi

# Homebrew
export HOMEBREW_TEMP="/tmp"
export HOMEBREW_PREFIX="/opt/homebrew"

fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions(N-/)
  $HOMEBREW_PREFIX/share/zsh/functions(N-/)
  ${fpath}
)

# C++
typeset -xT CPLUS_INCLUDE_PATH cplus_include_path
typeset -U cplus_include_path
cplus_include_path=(
  $HOMEBREW_PREFIX/include
  $HOMEBREW_PREFIX/opt/boost/include
  $HOMEBREW_PREFIX/include/boost
  $cplus_include_path
)

# JAVA
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:.

export XDG_DATA_HOME=/usr/local/share

#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Go
export GOROOT="$HOMEBREW_PREFIX"/opt/go/libexec/
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# AWS
export AWS_CONFIG_FILE=$HOME/.aws.conf

# unset LD_LIBRARY_PATH
# unset DYLD_LIBRARY_PATH
# unset DYLD_FALLBACK_LIBRARY_PATH

# export DOCKER_HOST=tcp://localhost:2375
# export BOOT2DOCKER_IP=`boot2docker ip 2>/dev/null`
# export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# if [ "`boot2docker status`" = "running" ]; then
#   $(boot2docker shellinit 2>/dev/null)
#   export DOCKER_ADDR=$(echo $DOCKER_HOST | sed 's/^tcp:\/\/\(.+\):\(\d+\)$/\1/g' )
#   export DOCKER_ADDR_PORT=$(echo $DOCKER_HOST | sed 's/^tcp:\/\///g' )
# fi

# Java
# export JAVA_HOME=`/usr/libexec/java_home`
# export PATH="$HOME/.jenv/bin:$PATH"

# Postgres
# source $HOME/.pgvm/pgvm_env

source $HOME/.zshenv.local

