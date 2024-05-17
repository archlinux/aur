# Maintainer: arbitar <aur@arbi.in>
# Original Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

_pkgname='fission'
pkgname='fission-bin'
pkgver='v1.20.1'
pkgrel=1
pkgdesc="Fast and Simple Serverless Functions for Kubernetes"
url="https://github.com/fission/fission"
depends=('kubectl')
license=('Apache')
arch=('x86_64')
source=("$_pkgname::https://github.com/fission/fission/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('4ba4cf38e320ff3845a397d574bc598b2889f5e9fcb859c540a46149bffe79de')

package() {
  install -Dm755 fission "$pkgdir/usr/bin/fission"
}
# vim:set ts=2 sw=2 et:
