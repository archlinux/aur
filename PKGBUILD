# Maintainer: Andreas Gerlach <andigerlach76@gmail.com>
pkgname=ijavascript
pkgver=5.0.14
pkgrel=1
pkgdesc="IJavascript is a JavaScript kernel for the Jupyter notebook"
arch=(any)
url="https://github.com/n-riesco/ijavascript"
license=('BSD-3-Clause')
depends=(
  'nodejs'
  'jupyter'
  'jupyter-notebook'
)
makedepends=('npm')

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
