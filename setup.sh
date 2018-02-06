#!/bin/bash
#
# Based on "https://github.com/ahmetb/dotfiles/blob/master/install_symlinks.sh"
# 
IFS=$'\n\t'
set -xeou pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for f in \
    .zshrc \
    .oh-my-zsh/custom/ansible.zsh \
    .oh-my-zsh/custom/docker.zsh \
    .oh-my-zsh/custom/go.zsh \
    .oh-my-zsh/custom/k8s.zsh; do
    if [ -f "$HOME/$f" ]; then rm "$HOME/$f"; fi
    ln -sf "$SCRIPT_DIR/$f" "$HOME/$f"
done