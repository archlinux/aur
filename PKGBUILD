# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

_pkgname='fission'
pkgname='fission-bin'
pkgver='1.14.1'
pkgrel=1
pkgdesc="Fast and Simple Serverless Functions for Kubernetes"
url="https://github.com/fission/fission"
depends=('kubectl')
license=('Apache')
arch=('x86_64')
source=("$_pkgname::https://github.com/fission/fission/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('2b738091d25d64bbcab1fa2d08253a25587f8480296bec751646cea4d7099f71')

package() {
  install -Dm755 fission "$pkgdir/usr/bin/fission"
}
# vim:set ts=2 sw=2 et:
