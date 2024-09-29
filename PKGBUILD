# Maintainer: Daniel Haß <aur@hass.onl>
_pkgname=faas-cli
pkgname=openfaas-cli-bin
pkgver=0.16.36
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('x86_64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
conflicts=('openfaas-cli')
source=("${_pkgname}-${pkgver}::https://github.com/openfaas/faas-cli/releases/download/${pkgver}/${_pkgname}")
sha256sums=("d24fd94945aa52a02bb97afa00facaf6384cf7f9eee6329a278182010635cfeb")

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${_pkgname}-${pkgver} $pkgdir/usr/bin/faas-cli
}
