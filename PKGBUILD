# Maintainer: Sander van Rossem <s.vanrossem@gmail.com>
pkgname="profont-otb"
pkgver="1.0.0"
pkgrel=1
pkgdesc='A small bitmap font which is absolutely great for programming (OTB version)'
arch=('any')
url='http://tobiasjung.name/profont/'
license=('MIT')
depends=(fontconfig xorg-font-utils)
source=('https://tobiasjung.name/downloadfile.php?file=profont-otb.zip')
sha256sums=('44741fb5b3689ac143ca3b71a905cad3d28d2c54571a4376754523c3cf10901e')

package() {
    install -d "$pkgdir/usr/share/fonts/misc"
    install -m644 "$srcdir/profont-otb/"*.otb "$pkgdir/usr/share/fonts/misc/"
}
