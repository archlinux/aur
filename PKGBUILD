# Maintainer: Sujaykumar Hublikar <hello@sujaykumarh.com>
_pkgname=lightdm-theme-sapphire
pkgname=lightdm-webkit2-theme-sapphire
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Sapphire theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/Sujaykumarh/${_pkgname}"
license=('Apache License, Version 2.0')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/Sujaykumarh/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b9d8cb4fa9ea779b408081df0b3446f5f571844f2366799ba5d898b0ed55427873cb0d81b1326cec549f0901cae17b3c8950948a157626898cf54b7ee5d4692a')

package() {
    rm "$srcdir/lightdm-theme-sapphire-${pkgver}.tar.gz"
    install -dm 755 "$pkgdir/usr/share/lightdm-webkit/themes/lightdm-theme-sapphire"
    cp -r "$srcdir/${_pkgname}/"* "$pkgdir/usr/share/lightdm-webkit/themes/lightdm-theme-sapphire/"
}

