# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luau-bin
pkgver=0.49.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/Luajit with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luau-linux-amd64")
sha256sums_x86_64=('cb3b6b7da59416be817781388412bd690f97ff35585e41e12ceb33dfe2d61f09')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luau"
}
