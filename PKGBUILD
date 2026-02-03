# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luau-bin
pkgver=0.40.1
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/teal with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luau-linux-amd64")
sha256sums_x86_64=('5ba759318ac206b37359a49849b964144fec6eba73e424c848dff2edda7ea604')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luau"
}
