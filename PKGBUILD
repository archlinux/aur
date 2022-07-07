# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.12.9
pkgrel=5
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
_pkgname=${pkgname//-bin/}
source=("${_pkgname}-${pkgver}_${pkgrel}.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/$(uname -m)/apk-tools-static-${pkgver}-r${pkgrel}.apk")
sha512sums=('6e9bfeb52f1611740a6bbe6f102a68e88178e53261617fa6c298b1410d3433124e226eccb23cf35022e591012a6c70658231f597180d4216eeb4c9311a8949de')

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
