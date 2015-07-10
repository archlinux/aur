# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=firacode
_realpackagename=FiraCode
pkgver=0.5
pkgrel=1
pkgdesc='Monospaced font with programming ligatures'
arch=('any')
url="https://github.com/tonsky/$_realpackagename/releases"
license=('SIL')
depends=()
makedepends=()
optsdepends=()
source=("https://github.com/tonsky/$_realpackagename/archive/$pkgver.tar.gz")
md5sums=('11e49eee5e0540828a8ba8298c404258')

package() {
    mkdir -p $pkgdir/usr/share/fonts
    install $srcdir/$_realpackagename-$pkgver/$_realpackagename-*.otf $pkgdir/usr/share/fonts
    install $srcdir/$_realpackagename-$pkgver/$_realpackagename-*.ttf $pkgdir/usr/share/fonts
    echo -e '\nRemember to call "fc-cache -rv" to update the font-cache!\n'
}
