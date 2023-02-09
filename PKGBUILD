# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.12.11
pkgrel=0
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
_pkgname=${pkgname//-bin/}
source=("${_pkgname}-${pkgver}_${pkgrel}.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/$(uname -m)/apk-tools-static-${pkgver}-r${pkgrel}.apk")
sha512sums=('587bbab500eb8ff22a178bc40376b8cf03fde6acd1e1181aba18c46dd80947d12d1b760d60b2c44d6fceec699eb89ee9b5d1e2d1b3996b860e744941b814fe05')

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
