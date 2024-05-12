# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='usrbinhx'
pkgver='2024.5.12'
pkgrel=3
pkgdesc='Please use the package ‘helixbinhx’ instead'
arch=('any')
url='https://aur.archlinux.org/packages/helixbinhx'
license=('AGPL-3.0-or-later')
conflicts=('hex' 'helixbinhx')
depends=('helix' 'sh')
source=('hx.sh')
sha256sums=('SKIP')
install="$pkgname.install"
changelog="$pkgname.changelog"

package() {
  install -vDm0755 'hx.sh' "$pkgdir/usr/bin/hx"
}

# eof
