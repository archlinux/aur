# Maintainer: Francisco Giordano <fg@frang.io>

pkgname=volta
pkgver=0.7.0_beta3
pkgrel=1
pkgdesc="JavaScript Launcher"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD')
depends=('openssl')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/volta-cli/volta/releases/download/v${pkgver//_/-}/volta-${pkgver//_/-}-linux-openssl-1.1.tar.gz")
md5sums=('d91c8ef7c56dad961eac201bb6ae7977')

package() {
        install -Dm755 -t "$pkgdir/usr/bin" volta volta-shim volta-migrate
}

# vim: et sw=8 ft=PKGBUILD
