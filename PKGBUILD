# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=bootleg-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Simple template processing command line tool to help build static websites'
arch=('x86_64')
url='https://github.com/retrogradeorbit/bootleg'
license=('EPL')
provides=('bootleg')
conflicts=()

source=("https://github.com/retrogradeorbit/bootleg/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.tgz")

sha256sums=('54d42af283e21b1512327996925b134247dc275e941b86f26110d117dbd03117')

package() {
  install -Dm755 "${srcdir}/bootleg" "${pkgdir}/usr/bin/bootleg"
}
