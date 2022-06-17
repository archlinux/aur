# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.12.9
pkgrel=4
pkgdesc="Alpine Package Keeper - package manager for alpine"
license=('Apache')
url="https://pkgs.alpinelinux.org/package/edge/main/x86/apk-tools-static"
arch=('any')
_pkgname=${pkgname//-bin/}
source=("${_pkgname}-${pkgver}_${pkgrel}.tgz::http://dl-cdn.alpinelinux.org/alpine/edge/main/$(uname -m)/apk-tools-static-${pkgver}-r${pkgrel}.apk")
sha512sums=('95def7177e8ef3d267ef980f3974ea72678486cbf4580d58998a8cf5361156f27200aa02bea342dab62b93b39429086be9153ec502e59b280ae81a0c1d9f50ea')

package() {
    install -Dm 755 "$srcdir/sbin/apk.static" "$pkgdir/usr/bin/apk.static"
}
