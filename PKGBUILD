# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luajit-bin
pkgver=0.51.2
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/Luajit with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luajit-linux-amd64")
sha256sums_x86_64=('e350aa5891e56e030761557c2638566cf62d876dbf5fd3c1db6e420f4701be32')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luajit"
}
