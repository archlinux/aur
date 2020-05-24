# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=bootleg-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='Simple template processing command line tool to help build static websites'
arch=('x86_64')
url='https://github.com/retrogradeorbit/bootleg'
license=('EPL')
provides=('bootleg')
conflicts=()

source=("https://github.com/retrogradeorbit/bootleg/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.tgz")

sha256sums=('7a78fd81b83ae665ab76dbc04ee492d8af5f738ee65ceb058a0cab58f6a1f0b3')

package() {
  install -Dm755 "${srcdir}/bootleg" "${pkgdir}/usr/bin/bootleg"
}
