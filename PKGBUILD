# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luau-bin
pkgver=0.46.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/teal with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luau-linux-amd64")
sha256sums_x86_64=('8452c8fa54354a1245c961c10594cb9771ec5812272cb61c288fb1e10fdcac7c')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luau"
}
