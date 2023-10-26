# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='usrbinhx'
pkgver='2023.10.26'
pkgrel=1
pkgdesc='Provide /usr/bin/hx for the helix editor'
arch=('any')
url='https://codeberg.org/kas/gists'
license=('AGPL3')
conflicts=('hex' 'helixbinhx')
depends=('helix' 'sh')
source=('hx.sh')
sha256sums=('184cdaf013c0b3ac2fe4b95842f8f2ff97ae2fbe38e36e363badc419f9eaffa0')

package() {
  install -Dm0755 'hx.sh' "$pkgdir/usr/bin/hx"
}

# eof
