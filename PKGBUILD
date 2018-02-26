# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=signato-font
pkgver=02.2018
pkgrel=1
pkgdesc="Cursive font based on the Act of Independence of Lithuania"
url="http://signato.lt"
arch=(any)
license=(custom)
source=("signato.zip::http://signato.lt/wp-content/uploads/2018/02/Archive-1.zip")
md5sums=('6a16465539e0e3eb76b1d3f340322205')

package() {
    cd $srcdir

    install -d "$pkgdir/usr/share/fonts/${pkgname%-font}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-font}" -m644 *.otf
    install -Dm644 'RULES FOR THE USE OF THE SIGNATO FONT.rtf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
