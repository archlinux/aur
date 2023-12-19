# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=trivy-bin
_pkgname=trivy
pkgver=0.48.1
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=(x86_64)
url="https://github.com/aquasecurity/trivy"
license=('AGPL')
makedepends=()
provides=('trivy')
conflicts=('trivy')
source=("https://github.com/aquasecurity/trivy/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('c111b6b6ce427b39dd2ec06eea5754d2b5afe249eb7436294b4aa4ad36bc47d9')

package() {
	install -Dm755 "${srcdir}/trivy" "${pkgdir}/usr/bin/trivy"
}
