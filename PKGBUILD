# Maintainer: daurnimator <quae@daurnimator.com>

pkgname=lua-yue-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Lua bindings to Yue: A library for creating native cross-platform GUI apps."
arch=('i686' 'x86_64')
url="http://libyue.com/"
license=('LGPL')
depends=('webkit2gtk')

source=(
  "https://github.com/yue/yue/releases/download/v${pkgver}/lua_yue_lua_5.3_v${pkgver}_linux_x64.zip"
)

md5sums=('b8911506da6041d0e2f6ad80e05e4324')

package() {
  install -D yue.so "$pkgdir"/usr/lib/lua/5.3/yue.so
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
