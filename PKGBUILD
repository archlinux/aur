# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=signato-font
pkgver=03.2019
pkgrel=1
pkgdesc="Cursive font based on the Act of Independence of Lithuania"
url="http://signato.lt"
arch=('any')
license=('custom')
source=("signato.zip::http://signato.lt/wp-content/uploads/2019/03/Signato_font.zip")
md5sums=('5d4075fe9b9fedd937e5be414e017727')

package() {
    cd $srcdir

    install -d "$pkgdir/usr/share/fonts/${pkgname%-font}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-font}" -m644 *.otf
    install -Dm644 'RULES FOR THE USE OF THE SIGNATO FONT.rtf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
