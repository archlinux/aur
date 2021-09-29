# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.12.7
pkgrel=3
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
_pkgname=${pkgname//-bin/}
source=("${_pkgname}-${pkgver}_${pkgrel}.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/$(uname -m)/apk-tools-static-${pkgver}-r${pkgrel}.apk")
sha512sums=('fd259ede0d4ca2b7b31dd5dafcc42bb61ce58e3087ddc846b027c809815c4082747a7c7d114f8283f261ef1a087c70c9dbf5550fd0fb5cffdd4e9ecb300d0276')

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
