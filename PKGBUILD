# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.12.9
pkgrel=6
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
_pkgname=${pkgname//-bin/}
source=("${_pkgname}-${pkgver}_${pkgrel}.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/$(uname -m)/apk-tools-static-${pkgver}-r${pkgrel}.apk")
sha512sums=('f557a0876a25e59822151f3453412eaa6b7c55eb257554a59cad0b06d92a9085bb20315d78aceaa3817551ad2714f6bd2c70e2154a816e7045624daa88635882')

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
