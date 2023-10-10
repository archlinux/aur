# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=parpar-bin
_pkgname=parpar
pkgver=0.4.2
pkgrel=1
pkgdesc='A high-performance, multithreaded PAR2 creation tool'
arch=('x86_64')
url='https://github.com/animetosho/ParPar'
license=('Public Domain')
depends=()
makedepends=()
provides=('parpar')
source=("https://github.com/animetosho/ParPar/releases/download/v${pkgver}/parpar-v${pkgver}-linux-static-amd64.xz")
sha256sums=('6afc5a45b861edaa1d82ee1eaed872a7ba74c363fea9d6eb735de2982a5598cb')

package() {
	install -Dm755 "${srcdir}/parpar-v${pkgver}-linux-static-amd64" "${pkgdir}/usr/bin/parpar"
}
