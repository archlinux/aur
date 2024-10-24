# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: LordMZTE <lord@mzte.de>

pkgname=skim-fzf-dropin
pkgver=1.2
pkgrel=2
pkgdesc="A dropin fzf replacement using skim"
url='https://aur.archlinux.org/packages/skim-fzf-dropin'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('sh' 'skim')
provides=('fzf')
conflicts=('fzf')
source=('fzf' 'fzf-tmux')
sha256sums=(
  '658b1a6d03ab747dc0ff46259e919c44209fbc2fe110aa0b0fb398075ef412c6'
  '8668e55bc2cf0874c872b71349a6c086a4eb77c303e264ae8e12bb374ab44fb6'
)

package() {
  install -vDm0755 -t "$pkgdir/usr/bin" fzf{,-tmux}
}

# eof
