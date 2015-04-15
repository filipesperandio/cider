#!/usr/bin/env bash
set -eu

# ------------------------------------------------------------------------------

log () {
  local fmt="» $1\n"; shift;
  tput setaf 2; printf "\n$fmt" "$@"; tput sgr0;
}

git_repo () {
  local src=$1; local dir=$2
  [ -d $dir/.git ] || git clone --recursive $src $dir
  pushd $dir
    git pull $src
    git submodule update --init --recursive
  popd
}

# ------------------------------------------------------------------------------
log "Updating iterm schemes…"
git_repo git@github.com:mbadolato/iTerm2-Color-Schemes.git ~/.iterm-schemes

# ------------------------------------------------------------------------------
log "Installing Oh My Zsh…"
[ -d ~/.oh-my-zsh ] || (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)

# ------------------------------------------------------------------------------
log "Installing latest ruby…"
TMP_RC=$(mktemp -t rcfile); cat << EOF > $TMP_RC
    LATEST_RUBY=\$(curl -s  https://raw.githubusercontent.com/postmodern/ruby-versions/master/ruby/versions.txt | sort | tail -n1)
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "\$(rbenv init -)"

    rbenv install \$LATEST_RUBY --skip-existing
    rbenv global \$LATEST_RUBY

    rm -f $TMP_RC
EOF
zsh --rcs $TMP_RC
unset TMP_RC

# ------------------------------------------------------------------------------
log "Installing latest nodejs…"
TMP_RC=$(mktemp -t rcfile); cat << EOF > $TMP_RC
    source \$(brew --prefix nvm)/nvm.sh
    nvm install stable
    nvm alias default stable

    rm -f $TMP_RC
EOF
zsh --rcs $TMP_RC
unset TMP_RC

# ------------------------------------------------------------------------------
log "Setting up jenv…"
mkdir -p ~/.jenv/versions
for jdk in /Library/Java/JavaVirtualMachines/jdk1.*/Contents/Home; do
  jenv add $jdk
done

# ------------------------------------------------------------------------------
log "Installing vim-plug…"
curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ------------------------------------------------------------------------------
log "Setting up boot2docker…"
boot2docker init

# ------------------------------------------------------------------------------
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s
