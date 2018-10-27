# Maintainer: Sujaykumar Hublikar <sujaykumar6390@gmail.com>
_pkgname=lightdm-theme-sapphire
pkgname=lightdm-webkit2-theme-sapphire
pkgver=1.0
pkgrel=1
pkgdesc="A simple Sapphire theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/Sujaykumarh/${_pkgname}"
license=('Apache License, Version 2.0')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/Sujaykumarh/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7ab20fb216b39ec8aedc5b1807b807d00baabbe6703004fdb6599ea0d33ea5d58d4d178ffcbeed2bc95a173b5ba63fddbdf5bec1cd1fc81b110205eb78e1aff1')

package() {
    rm "$srcdir/lightdm-theme-sapphire-${pkgver}.tar.gz"
    install -dm 755 "$pkgdir/usr/share/lightdm-webkit/themes/lightdm-theme-sapphire"
    cp -r "$srcdir/${_pkgname}/"* "$pkgdir/usr/share/lightdm-webkit/themes/lightdm-theme-sapphire/"
}

