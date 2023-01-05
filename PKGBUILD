# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=trivy-bin
_pkgname=trivy
pkgver=0.36.1
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=(x86_64)
url="https://github.com/aquasecurity/trivy"
license=('AGPL')
makedepends=()
provides=('trivy')
conflicts=('trivy')
source=("https://github.com/aquasecurity/trivy/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('ae5437b2d3740b267833499cae9ef918255ffeba2367eeb2b9e62b18dd9d2600')

package() {
	install -Dm755 "${srcdir}/trivy" "${pkgdir}/usr/bin/trivy"
}
