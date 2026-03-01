# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luau-bin
pkgver=0.45.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/teal with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luau-linux-amd64")
sha256sums_x86_64=('a13c14a5ae6b66a71865077aeecca0283ad0dae160788200cdd69afa8531448e')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luau"
}
