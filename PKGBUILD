# Maintainer: Daniel Haß <aur@hass.onl>
_pkgname=faas-cli
pkgname=openfaas-cli-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('x86_64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
conflicts=('openfaas-cli')
source=("https://github.com/openfaas/faas-cli/releases/download/${pkgver}/${_pkgname}")
sha256sums=("1a8d9f4562e025bcb438e878eb87ac4dee1399329f4d9d9e2385ef47163d311a")

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${_pkgname} $pkgdir/usr/bin/faas-cli
}
