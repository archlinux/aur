# Maintainer: Daniel Haß <aur@hass.onl>
_pkgname=faas-cli
pkgname=openfaas-cli-bin
pkgver=0.14.11
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('x86_64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
conflicts=('openfaas-cli')
source=("${_pkgname}-${pkgver}::https://github.com/openfaas/faas-cli/releases/download/${pkgver}/${_pkgname}")
sha256sums=("3c4fc3c40845f9cfe12a87ebf14ebe342ff7aad3520052d77858303ede8c2867")

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${_pkgname}-${pkgver} $pkgdir/usr/bin/faas-cli
}
