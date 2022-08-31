# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=apigeectl-bin
pkgver=1.8.0
_build=${pkgver}
pkgrel=1
pkgdesc='apigeectl is a command-line interface (CLI) for installing and managing Apigee hybrid in a Kubernetes cluster.'
url='https://cloud.google.com/apigee/docs/hybrid/v1.8/install-apigeectl'
arch=('x86_64')
license=('unknown')
conflicts=()

source_x86_64=("$pkgname-$pkgver::https://storage.googleapis.com/apigee-release/hybrid/apigee-hybrid-setup/${_build}/apigeectl_linux_64.tar.gz")
sha256sums_x86_64=('bb92c3132bd2fbc400abcdcfb3fb6f0de9079c7acfa24cf96c77752dd4fac468')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/apigee*/apigeectl ${pkgdir}/usr/bin/apigeectl
}

