# Maintainer: arbitar <aur@arbi.in>
# Original Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

_pkgname='fission'
pkgname='fission-bin'
pkgver='v1.22.0'
pkgrel=1
pkgdesc="Fast and Simple Serverless Functions for Kubernetes"
url="https://github.com/fission/fission"
depends=('kubectl')
license=('Apache')
arch=('x86_64')
source=("$_pkgname::https://github.com/fission/fission/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('1d6ca778dd3ef676572ed077650721fb9fbaecc3106c9152372dd36b9a730422')

package() {
  install -Dm755 fission "$pkgdir/usr/bin/fission"
}
# vim:set ts=2 sw=2 et:
