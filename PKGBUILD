# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=coy-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A safe and secure chat client"
arch=('x86_64')
url="https://coy.im"
license=(GPL)
depends=('glibc' 'gtk3')
provides=('coy')
source=("https://dl.bintray.com/twstrike/coyim/v0.2/linux/amd64/coyim")
sha256sums=('182bd3332181e01b77141e9d884ba1c3e7328d5b52b5e75cd5c1c84372a9f130')

package() {
  install -Dm755 "${srcdir}/coyim" "${pkgdir}/usr/bin/coyim"
}

# vim:set ts=2 sw=2 et:
