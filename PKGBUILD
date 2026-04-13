# Maintainer: NullMaker <usernaem.cc@gmail.com>
pkgname=ltg
pkgver=1.0rel
pkgrel=1
pkgdesc="Listen To Get, The Free LRC generating script."
arch=('any')
license=('MIT')
depends=('songrec' 'curl' 'jq')
source=("ltg")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/../ltg" "${pkgdir}/usr/bin/ltg"
}
