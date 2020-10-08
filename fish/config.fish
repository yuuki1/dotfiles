### Abbr

abbr -a q exit
abbr -a v nvim
abbr -a c code
abbr -a s ssh
abbr -a r . ~/.config/fish/config.fish
abbr -a cf {$EDITOR} ~/.config/fish/config.fish

abbr -a ll ls -lh
abbr -a la ls -a
abbr -a cp cp -p

abbr -a mb make build
abbr -a mt make test

abbr -a g git
abbr -a gst git status
abbr -a gl git log -p
abbr -a gbr git-browse-remote
abbr -a gv gh repo view --web
abbr -a u cd-gitroot

abbr -a pr poetry run

abbr -a k kubectl
abbr -a d docker
abbr -a dm docker-machine
abbr -a dc docker-compose

abbr -a gcs gcloud compute ssh


gabbr --add G '| grep'
gabbr --add H '| head'
gabbr --add T '| tail'
gabbr --add L '| less'
gabbr --add ... '..//..'
gabbr --add .... '..//..//..'
gabbr --add ..... '..//..//..//..'

### Key bindings

bind \cxb fzf_git_recent_branch

bind \cs '__ghq_repository_search'
if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \cs '__ghq_repository_search'
end

### Enviroment variables

# LANG
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x EDITOR nvim
set -x PAGER less

# Homebrew
set -x HOMEBREW_TEMP /tmp
set -x HOMEBREW_PREFIX "$HOME/homebrew"

# System path
set -x PATH "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin" $PATH
set -x PATH /usr/local/bin /usr/local/sbin /usr/sbin /usr/bin $PATH

# coreutils
set -x PATH "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin" $PATH
set -x PATH "$HOMEBREW_PREFIX/opt/gettext/bin" "$HOMEBREW_PREFIX/opt/grep/libexec/gnubin" $PATH

# Languages path
set -x PATH "$HOME/.rbenv/bin" "$HOME/.plenv/bin" "$HOME/.pyenv/bin" "$HOME/.cargo/bin" $PATH

# Go
set -x GOPATH "$HOME/go"
set -x PATH "$GOPATH/bin" $PATH
set -x GOENV_ROOT "$HOME/.goenv"
set -x PATH "$GOENV_ROOT/bin" $PATH
set -x PATH "$GOROOT/bin" $PATH
set -x PATH "$GOPATH/bin" $PATH 

# Python
set -x PATH "$HOME/Library/Python/3.8/bin" $PATH

# Ruby
set -x PATH "$HOMEBREW_PREFIX/opt/ruby/bin" "(gem environment gemdir)/bin" $PATH

set -x LD_LIBRARY_PATH "$HOMEBREW_PREFIX/lib" $LD_LIBRARY_PATH
set -x DYLD_FALLBACK_LIBRARY_PATH "$HOMEBREW_PREFIX/lib" "$DYLD_FALLBACK_LIBRARY_PATH"
set -x C_INCLUDE_PATH "$HOMEBREW_PREFIX/include" $C_INCLUDE_PATH
set -x CPLUS_INCLUDE_PATH "$HOMEBREW_PREFIX/include"
set -x CFLAGS "-I$HOMEBREW_PREFIX/include"
set -x CXXLAGS "-I$HOMEBREW_PREFIX/include"
set -x LDFLAGS "-L$HOMEBREW_PREFIX/lib"

# Rust
if type -q rustc
  set -x RUST_SRC_PATH "(rustc --print sysroot)/lib/rustlib/src/rust/src/"
end

# Node.js
set -x PATH "$HOME/.ndenv/bin" $PATH

# Kubernetes
set -x PATH "$HOME/.krew/bin" $PATH
set -x PATH "$HOME/.kube/plugins/jordanwilson230" $PATH

# User specifc path
set -x PATH "$HOME/local/bin" "$HOME/bin" $PATH

set -x SUDO_PATH /usr/local/sbin /usr/sbin /sbin

set -x MAN_PATH "HOMEBREW_PREFIX/share/man" "$HOME/local/share/man" /usr/local/share/man /usr/share/man

set -x CLASSPATH $CLASSPATH "$JAVA_HOME/lib" .

### External tools settings

# rbenv
if type -q rbenv
  eval (rbenv init - --no-rehash | source)
end

# plenv
if type -q plenv
  eval (plenv init - | source)
end

# pyenv
if type -q pyenv
  eval (pyenv init - | source)
end

# direnv
if type -q direnv
  eval (direnv hook fish)
end

# dockertoolbox
if type -q docker-machine
  eval (docker-machine env default 2>/dev/null)
end

# go
if type -q goenv
  eval (goenv init - | source)
end

# rustup
if test -e "$HOME/.cargo/env"
  source "$HOME/.cargo/env"
end

# ndenv
if test -e ndenv
  eval (ndenv init - | source)
end

### Functions

function attach_tmux_session_if_needed
  set ID (tmux list-sessions)
  if test -z "$ID"
    tmux new-session
    return
  end

  set new_session "Create New Session" 
  set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
  if test "$ID" = "$new_session"
    tmux new-session
  else if test -n "$ID"
    tmux attach-session -t "$ID"
  end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end
