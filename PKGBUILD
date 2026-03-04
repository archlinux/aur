# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luau-bin
pkgver=0.45.3
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/teal with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luau-linux-amd64")
sha256sums_x86_64=('050931f40c6b1fc11a2caa9fa4d281f22fc5848f7e7158982f9df44a8cf370cb')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luau"
}
