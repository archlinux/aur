# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=trivy-bin
_pkgname=trivy
pkgver=0.29.2
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=(x86_64)
url="https://github.com/aquasecurity/trivy"
license=('AGPL')
makedepends=()
provides=('trivy')
conflicts=('trivy')
source=("https://github.com/aquasecurity/trivy/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('d9d0fdb351dfea340e6621b2f9cbd4e1b86ecc83f05a9d31ce265839259c7576')

package() {
	install -Dm755 "${srcdir}/trivy" "${pkgdir}/usr/bin/trivy"
}
