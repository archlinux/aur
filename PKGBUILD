# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=datalevin-bin
pkgver=0.6.18
pkgrel=1
pkgdesc='Simple, fast and versatile Datalog database for everyone.'
arch=('x86_64')
url='https://github.com/juji-io/datalevin'
license=('EPL')
provides=('datalevin')
conflicts=()

source=("https://github.com/juji-io/datalevin/releases/download/${pkgver}/dtlv-${pkgver}-ubuntu-latest-amd64.zip")

sha256sums=('4a10c12641e0ec501783531ceccdd4fa897d312b15cf373a1965a7babc07424f')

package() {
  install -Dm755 "${srcdir}/dtlv" "${pkgdir}/usr/bin/dtlv"
}
