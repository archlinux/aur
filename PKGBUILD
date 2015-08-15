# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=firacode
_realpackagename=FiraCode
pkgver=0.6
pkgrel=1
pkgdesc='Monospaced font with programming ligatures'
arch=('any')
url="https://github.com/tonsky/$_realpackagename/releases"
license=('SIL')
depends=()
makedepends=()
optsdepends=()
source=("https://github.com/tonsky/$_realpackagename/archive/$pkgver.tar.gz")
md5sums=('fb55f89b756d24bccc0685d1ecd78719')

package() {
    mkdir -p $pkgdir/usr/share/fonts
    install -m644 "$srcdir/$_realpackagename-$pkgver/$_realpackagename-Regular.otf" "$pkgdir/usr/share/fonts/OTF"
    install -m644 -D "$srcdir/$_realpackagename-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo -e '\nRemember to call "fc-cache -rv" to update the font-cache!\n'
}
