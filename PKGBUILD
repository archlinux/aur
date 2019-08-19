# Maintainer: Daniel Haß <aur@hass.onl>
_pkgname=faas-cli
pkgname=openfaas-cli-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('x86_64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
conflicts=('openfaas-cli')
source=("https://github.com/openfaas/faas-cli/releases/download/${pkgver}/${_pkgname}")
sha256sums=("e757f76453742e9260a24e46fbb1ee2c2cd736a48be35b3b1bdd0f30c8061491")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${_pkgname} $pkgdir/usr/bin/faas-cli
}
