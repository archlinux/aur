# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=trivy-bin
_pkgname=trivy
pkgver=0.0.13
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=(x86_64)
url="https://github.com/knqyf263/trivy"
license=('AGPL')
makedepends=()
provides=('trivy')
conflicts=('trivy')
source=("https://github.com/knqyf263/trivy/releases/download/v0.0.13/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=("f2aaf48439970e49cf2da83e45314901641b87196b148bd473c672c2262299a6")

package() {
	install -Dm755 "${srcdir}/trivy" "${pkgdir}/usr/bin/trivy"
}
