# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=arm-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Armory CLI or better know as arm cli is a tool that let you render dinghyfiles offline."
arch=('any')
url="https://github.com/armory-io/arm"
license=('Apache')
source=("https://github.com/armory-io/arm/releases/download/$pkgver/arm-$pkgver-linux-amd64.zip")
sha512sums=('d92e3ce5a5ad603b69d5defe3e823408ef177ce920c0b899f17e70b1634cddfb1b10200932f5f54efacb291c5558f43abf466be1489dcf2de58314d313e800ee')

package() {
    install -Dm0755 ${srcdir}/arm-$pkgver-linux-amd64 "$pkgdir/usr/local/bin/arm"
}
