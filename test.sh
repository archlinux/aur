#!/bin/bash

set -eu

source ./PKGBUILD

echo "## install start"
pacman -U --noconfirm ${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz

echo "## install complete"

echo "## check installed files"

cfn-guard --help

echo "## check bash completion"
ls -l /usr/share/bash-completion/completions/cfn-guard
head /usr/share/bash-completion/completions/cfn-guard

echo "## check zsh completion"
ls -l /usr/share/zsh/site-functions/_cfn-guard
head /usr/share/zsh/site-functions/_cfn-guard

echo "## check fish completion"
ls -l /usr/share/fish/completions/cfn-guard.fish
head /usr/share/fish/completions/cfn-guard.fish

echo "test OK"
