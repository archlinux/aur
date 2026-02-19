# Maintainer: tee < teeaur at duck dot com >
pkgname=astra-luajit-bin
pkgver=0.42.0
pkgrel=1
pkgdesc="Blazingly Fast 🔥 web server runtime for Lua/Luau/teal with sqlite support"
arch=(x86_64)
url="https://github.com/ArkForgeLabs/Astra"
license=('custom AND Apache-2.0')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/astra-luajit-linux-amd64")
sha256sums_x86_64=('ae89fc4b8bf6cef14305aaa4d5b121c64f4b292dda9db61bf8e8b0940cd792d3')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/astra-luajit"
}
