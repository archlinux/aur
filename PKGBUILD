# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=lua-emmy-language-server-bin
pkgver=0.4.19
pkgrel=1
pkgdesc="Language server for Lua from the Emmy IntelliJ IDEA plugin."
arch=(any)
url="https://github.com/EmmyLua/EmmyLua-LanguageServer"
license=('Apache')
depends=()
provides=('lua-emmy-language-server')
conflicts=('lua-emmy-language-server')
source=("emmylua-$pkgver.jar::https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/download/$pkgver/EmmyLua-LS-all.jar")
md5sums=('df1734a0a3abf627fbf8ef6ab739d08f')
sha256sums=('e60ab0fc86774553e2ace1aa0b2664278cebe4af90bbbeb581389f22ea8a3964')
noextract=('EmmyLua-LS-all.jar')

package() {
  install -Dm644 "$srcdir/emmylua-$pkgver.jar" "$pkgdir/usr/lib/lua-emmy-language-server/EmmyLua-LS-all.jar"
}
