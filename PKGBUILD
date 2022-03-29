# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=datalevin-bin
pkgver=0.6.3
pkgrel=1
pkgdesc='Simple, fast and versatile Datalog database for everyone.'
arch=('x86_64')
url='https://github.com/juji-io/datalevin'
license=('EPL')
provides=('datalevin')
conflicts=()

source=("https://github.com/juji-io/datalevin/releases/download/${pkgver}/dtlv-${pkgver}-ubuntu-latest-amd64.zip")

sha256sums=('a98a145ee847c5972437aecd45c68fd94fda008afdc281deb380b316b4e5a1e5')

package() {
  install -Dm755 "${srcdir}/dtlv" "${pkgdir}/usr/bin/dtlv"
}
