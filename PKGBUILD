# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=lua-emmy-language-server-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Language server for Lua from the Emmy IntelliJ IDEA plugin."
arch=(any)
url="https://github.com/EmmyLua/EmmyLua-LanguageServer"
license=('Apache')
depends=()
provides=('lua-emmy-language-server')
conflicts=('lua-emmy-language-server')
source=("https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/download/$pkgver/EmmyLua-LS-all.jar")
md5sums=('d0debec2d40fe8b86a122b3666ffb51b')
sha256sums=('83d04e393e4b8c8f2bdd7d93387c9c6b79f2cadd64307f7db8184aecf7bc5810')
noextract=('EmmyLua-LS-all.jar')

package() {
  install -Dm644 "$srcdir/EmmyLua-LS-all.jar" "$pkgdir/usr/lib/lua-emmy-language-server/EmmyLua-LS-all.jar"
}
