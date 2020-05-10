# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=trivy-bin
_pkgname=trivy
pkgver=0.6.0
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=(x86_64)
url="https://github.com/aquasecurity/trivy"
license=('AGPL')
makedepends=()
provides=('trivy')
conflicts=('trivy')
source=("https://github.com/aquasecurity/trivy/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=("eb91162ffae4e590879e955ebd0c17e520c42ebb68d634ab09a359f00c0bf9ee")

package() {
	install -Dm755 "${srcdir}/trivy" "${pkgdir}/usr/bin/trivy"
}
