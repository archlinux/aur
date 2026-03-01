# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luajit-bin
pkgver=0.45.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/teal with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luajit-linux-amd64")
sha256sums_x86_64=('dc6fd23cf6a2086b4cfdf3ec0a77951bfd453eadcf7bd0f89768f801416a6d28')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luajit"
}
