# Maintainer: TheAifam5 <theaifam5 at gmail com>

_pkgver=3.0.2
pkgname=sol2
pkgver=v${_pkgver}
pkgrel=2
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git')
optdepends=('lua' 'lua51' 'lua52' 'luajit')
conflicts=('sol2')
provides=('sol2')
source=("https://github.com/ThePhD/sol2/archive/$pkgver.tar.gz")
sha256sums=('6265ade1efd5b1133d71fa3b81fd0214ccf964992a8cbab3dfae650a00ed0258')

package() {
  install -d $pkgdir/usr/include
  cp -rf ./$pkgname-$_pkgver/include $pkgdir/usr
}
