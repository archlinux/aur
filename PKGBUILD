# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=bootleg-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Simple template processing command line tool to help build static websites'
arch=('x86_64')
url='https://github.com/retrogradeorbit/bootleg'
license=('EPL')
provides=('bootleg')
conflicts=()

source=("https://github.com/retrogradeorbit/bootleg/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.tgz")

sha256sums=('55d1627387a5e534b5a2632d69790140778200b2a382947c36a2c9fc28b04077')

package() {
  install -Dm755 "${srcdir}/bootleg" "${pkgdir}/usr/bin/bootleg"
}