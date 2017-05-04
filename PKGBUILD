# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=ttf-lastresort
pkgver=1
pkgrel=1
pkgdesc="Unicode last resort fallback font."
arch=('any')
url="http://www.unicode.org/policies/lastresortfont_eula.html"
license=('custom')
makedepends=('unzip')
source=("http://www.unicode.org/cgi-bin/LastResortDownload.zip"
        "LICENSE")
sha256sums=('79038e1374c335538b595e0f16f82f255f053cbd48cb1fb53578888ca3c3072e'
            '9082dee8e04cad811763d142f6da465e0b62af4a25bf1b86ed44f0190326ebbc')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -t "$pkgdir/usr/share/fonts/TTF" -m644 "LastResort.ttf"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ttf-lastresort/LICENSE"
}
