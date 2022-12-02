# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=datalevin-bin
pkgver=0.6.27
pkgrel=1
pkgdesc='Simple, fast and versatile Datalog database for everyone.'
arch=('x86_64')
url='https://github.com/juji-io/datalevin'
license=('EPL')
provides=('datalevin')
conflicts=()

source=("https://github.com/juji-io/datalevin/releases/download/${pkgver}/dtlv-${pkgver}-ubuntu-latest-amd64.zip")

sha256sums=('590f35f02fdee187b459e712bb6874fc3df3f623fe6dd4ab980bc75503e3e622')

package() {
  install -Dm755 "${srcdir}/dtlv" "${pkgdir}/usr/bin/dtlv"
}
