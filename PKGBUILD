# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='usrbinhx'
pkgver='2023.02.20'
pkgrel=1
pkgdesc='Provide /usr/bin/hx for the helix editor'
arch=('any')
url='https://codeberg.org/kas/gists'
license=('AGPL3')
conflicts=('hex')
depends=('helix')
source=('hx.sh')
sha256sums=('a4c0915dc04d642a176dca205c3b41e4947def6a9f1afd01b44c8c2ef9980a9c')

package() {
  install -Dm0755 'hx.sh' "$pkgdir/usr/bin/hx"
}

# eof
