# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=datalevin-bin
pkgver=0.6.29
pkgrel=1
pkgdesc='Simple, fast and versatile Datalog database for everyone.'
arch=('x86_64')
url='https://github.com/juji-io/datalevin'
license=('EPL')
provides=('datalevin')
conflicts=()

source=("https://github.com/juji-io/datalevin/releases/download/${pkgver}/dtlv-${pkgver}-ubuntu-latest-amd64.zip")

sha256sums=('8e12107763577ec55c7b8d814af911a7159f446764ba253451842038f63a4d78')

package() {
  install -Dm755 "${srcdir}/dtlv" "${pkgdir}/usr/bin/dtlv"
}
