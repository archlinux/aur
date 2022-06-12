# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgbase=lua-xmlrpc
pkgname=('lua51-xmlrpc' 'lua52-xmlrpc')
pkgver=1.2.2
pkgrel=1
pkgdesc="Lua XML-RPC is a Lua package to access and provide XML-RPC services"
arch=('any')
url="https://keplerproject.github.io/lua-xmlrpc/"
license=('GPL')
makedepends=('lua51' 'lua52')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/timn/lua-xmlrpc/archive/$pkgver.tar.gz")
md5sums=('6e3164e70dd1a67b86eda6caf517a4ae')

package_lua51-xmlrpc() {
  depends=('lua51' 'lua51-expat' 'lua51-socket')

  cd ${pkgbase}-${pkgver}
  make LUA_DIR="${pkgdir}/usr/share/lua/5.1" install
}

package_lua52-xmlrpc() {
  depends=('lua52' 'lua52-expat' 'lua52-socket')

  cd ${pkgbase}-${pkgver}
  make LUA_DIR="${pkgdir}/usr/share/lua/5.2" install
}
