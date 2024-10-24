# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: LordMZTE <lord@mzte.de>

pkgname=skim-fzf-dropin
pkgver=1.3
pkgrel=1
pkgdesc="A dropin fzf replacement using skim"
url='https://aur.archlinux.org/packages/skim-fzf-dropin'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('sh' 'skim')
provides=('fzf')
conflicts=('fzf')
source=('fzf')
sha256sums=('74960b3bde46a2c59c201e67010e61dac1fabf062de9ea1cf0e85b45ab11672a')

package() {
  install -vDm0755 -t "$pkgdir/usr/bin" fzf
  cd "$pkgdir/usr/bin"
  ln -vs fzf{,-tmux}
}

# eof
