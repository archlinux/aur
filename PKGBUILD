# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.12.5
pkgrel=1
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
source=("apk-tools-static.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/$(uname -m)/apk-tools-static-${pkgver}-r${pkgrel}.apk"
)
sha512sums=('ddaf26e879fdf9642639ec9331e0f00fe93349e80935d88b3e539fa6221a832add7787be09c9a39649a744c8d8f3049aba9ee10eb9ce4cab932a00706531cc75')

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
