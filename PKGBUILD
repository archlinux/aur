# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=lua-emmy-language-server-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Language server for Lua from the Emmy IntelliJ IDEA plugin."
arch=(any)
url="https://github.com/EmmyLua/EmmyLua-LanguageServer"
license=('Apache')
depends=()
provides=('lua-emmy-language-server')
conflicts=('lua-emmy-language-server')
source=("emmylua-$pkgver.jar::https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/download/$pkgver/EmmyLua-LS-all.jar")
md5sums=('85e39b2fe5c919389e7c34e8550fa970')
sha256sums=('24ab060cb86fd734a4da49853109f18fdbc006246b4f5d895600993af8d83877')
noextract=('EmmyLua-LS-all.jar')

package() {
  install -Dm644 "$srcdir/emmylua-$pkgver.jar" "$pkgdir/usr/lib/lua-emmy-language-server/EmmyLua-LS-all.jar"
}
