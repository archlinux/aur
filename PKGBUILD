# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=datalevin-bin
pkgver=0.6.17
pkgrel=1
pkgdesc='Simple, fast and versatile Datalog database for everyone.'
arch=('x86_64')
url='https://github.com/juji-io/datalevin'
license=('EPL')
provides=('datalevin')
conflicts=()

source=("https://github.com/juji-io/datalevin/releases/download/${pkgver}/dtlv-${pkgver}-ubuntu-latest-amd64.zip")

sha256sums=('efba5347eb349c14ec64b8ebd9b51ccd1eb6a08b1dbe93ec9e5c529c522d0371')

package() {
  install -Dm755 "${srcdir}/dtlv" "${pkgdir}/usr/bin/dtlv"
}
