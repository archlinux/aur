# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=bootleg-bin
pkgver=0.1.6_1
pkgrel=1
pkgdesc='Simple template processing command line tool to help build static websites'
arch=('x86_64')
url='https://github.com/retrogradeorbit/bootleg'
license=('EPL')
provides=('bootleg-bin')
conflicts=('bootleg-bin')

source=("https://github.com/retrogradeorbit/bootleg/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.tgz")

sha256sums=('50006950f9ff90ba8396543b1071cc2a7730b762e6d05a1ebf58048adb115e45')

package() {
  install -Dm755 "${srcdir}/bootleg" "${pkgdir}/usr/bin/bootleg"
}