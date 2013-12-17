pkgname=ttf-digital-7
pkgver=1.1
pkgrel=1
url="http://www.styleseven.com"
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A truetype font which is perfect for digital clocks."
arch=('any')
license=('custom')
source=(digital_7.zip::http://img.dafont.com/dl/?f=digital_7)
install=$pkgname.install
md5sums=('fedbddce28f059e7468c7031d050623a')

package() {
    cd $srcdir
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"

    install -Dm 644 digital-7*.ttf $pkgdir/usr/share/fonts/TTF/
    install -Dm 644 readme.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}

