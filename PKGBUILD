# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=parpar-bin
_pkgname=parpar
pkgver=0.4.5
pkgrel=1
pkgdesc='A high-performance, multithreaded PAR2 creation tool'
arch=('x86_64')
url='https://github.com/animetosho/ParPar'
license=('custom:CC0')
depends=()
makedepends=()
provides=('parpar')
source=("https://github.com/animetosho/ParPar/releases/download/v${pkgver}/parpar-v${pkgver}-linux-static-amd64.xz")
sha256sums=('cbcc24eb6e01559a03ccce190e330d4eb92216c9f87d430439d932727202156d')
options=('!strip')

package() {
	install -Dm755 "${srcdir}/parpar-v${pkgver}-linux-static-amd64" "${pkgdir}/usr/bin/parpar"
}
