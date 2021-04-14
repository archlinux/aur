# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=apigeectl-bin
pkgver=1.4.2
_build=${pkgver}
pkgrel=0
pkgdesc='apigeectl is a command-line interface (CLI) for installing and managing Apigee hybrid in a Kubernetes cluster.'
url='https://cloud.google.com/apigee/docs/hybrid/v1.3/cli-reference'
arch=('x86_64')
license=('unknown')
conflicts=()

source_x86_64=("$pkgname-$pkgver::https://storage.googleapis.com/apigee-release/hybrid/apigee-hybrid-setup/${_build}/apigeectl_linux_64.tar.gz")
sha256sums_x86_64=('4c9702d9c4116b63f8c19e170ab6a58aa6b74047c44760907917551d4b68867e')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/apigee*/apigeectl ${pkgdir}/usr/bin/apigeectl
}

