# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=apigeectl-bin
pkgver=1.4.4
_build=${pkgver}
pkgrel=1
pkgdesc='apigeectl is a command-line interface (CLI) for installing and managing Apigee hybrid in a Kubernetes cluster.'
url='https://cloud.google.com/apigee/docs/hybrid/v1.3/cli-reference'
arch=('x86_64')
license=('unknown')
conflicts=()

source_x86_64=("$pkgname-$pkgver::https://storage.googleapis.com/apigee-release/hybrid/apigee-hybrid-setup/${_build}/apigeectl_linux_64.tar.gz")
sha256sums_x86_64=('07113755096d67cbdb06964f5e01aca7ed11652b8422a72a86c1d812aff935dd')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/apigee*/apigeectl ${pkgdir}/usr/bin/apigeectl
}

