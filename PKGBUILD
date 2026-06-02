# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luajit-bin
pkgver=0.49.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/Luajit with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luajit-linux-amd64")
sha256sums_x86_64=('53cfaa751e8ca3cd71463e2117409e392f5b386c0bad85e78ce4fce7935da710')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luajit"
}
