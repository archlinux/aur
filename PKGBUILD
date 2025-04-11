# Maintainer: arbitar <aur@arbi.in>
# Original Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

_pkgname='fission'
pkgname='fission-bin'
pkgver='v1.21.0'
pkgrel=1
pkgdesc="Fast and Simple Serverless Functions for Kubernetes"
url="https://github.com/fission/fission"
depends=('kubectl')
license=('Apache')
arch=('x86_64')
source=("$_pkgname::https://github.com/fission/fission/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('b12b0d4499fa74406b885c3d5be642ae698d87251e3d19ec09c4588935de5555')

package() {
  install -Dm755 fission "$pkgdir/usr/bin/fission"
}
# vim:set ts=2 sw=2 et:
