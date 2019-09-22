# Maintainer: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.10.4
pkgrel=3
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
source=("apk-tools-static.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/${CARCH}/apk-tools-static-${pkgver}-r${pkgrel}.apk"
)
sha512sums=("SKIP")

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
