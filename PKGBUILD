# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luajit-bin
pkgver=0.48.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/Luajit with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luajit-linux-amd64")
sha256sums_x86_64=('c8c1c39f193bd07c30af7f39e108a0685b1dcb899c9dfa8609654bff0fb031fa')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luajit"
}
