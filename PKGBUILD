# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=trivy-bin
_pkgname=trivy
pkgver=0.58.1
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=(x86_64)
url="https://github.com/aquasecurity/trivy"
license=('AGPL')
makedepends=()
provides=('trivy')
conflicts=('trivy')
source=("https://github.com/aquasecurity/trivy/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('21a5eea31d072b34a6284855249f4074ff43c618d398f9ec328bef4ff7c2fa0d')

package() {
	install -Dm755 "${srcdir}/trivy" "${pkgdir}/usr/bin/trivy"
}
