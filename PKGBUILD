# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='usrbinhx'
pkgver='2023.10.26'
pkgrel=2
pkgdesc='Provide /usr/bin/hx for the helix editor'
arch=('any')
url='https://codeberg.org/kas/gists'
license=('AGPL3')
conflicts=('hex' 'helixbinhx')
depends=('helix' 'sh')
source=('hx.sh')
sha256sums=('bc36799721ea4d0c3e1723f02b2b426c345bb180affebc72a529cd3a811f7f9c')

package() {
  install -Dm0755 'hx.sh' "$pkgdir/usr/bin/hx"
}

# eof
