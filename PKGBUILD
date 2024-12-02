# Maintainer: Daniel Haß <aur@hass.onl>
_pkgname=faas-cli
pkgname=openfaas-cli-bin
pkgver=0.16.37
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('x86_64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
conflicts=('openfaas-cli')
source=("${_pkgname}-${pkgver}::https://github.com/openfaas/faas-cli/releases/download/${pkgver}/${_pkgname}")
sha256sums=("8629029a33ac1d8f1d4f067968caf09383ae99c83a41499ada1cf3b90bf0ac52")

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${_pkgname}-${pkgver} $pkgdir/usr/bin/faas-cli
}
