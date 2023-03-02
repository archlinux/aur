# Maintainer: cloudycat <cat@cloudycat.cc>
pkgname='unum'
pkgver=3.5_15.0.0
pkgrel=1
pkgdesc="Utility for looking up Unicode characters and HTML entities"
arch=('any')
url="https://www.fourmilab.ch/webtools/unum/"
license=('custom:CC-BY-SA-4.0')
depends=(perl bzip2)
source=("https://www.fourmilab.ch/webtools/unum/download/${pkgname}_comp.tar.gz"
        "LICENSE.md")
sha512sums=('e0bf523a3a1d71ca221fe8b0b3dd0375e61448699980523605c5f8aa0922abe978893e65856d1a34da9cbd02402542a7dbcfd1b2fc8287e62f8ed144e9e545af'
            '8c2a49cd5d3b04f803f7b60b9897c6f5c2f869454135334972c75426cf4558c7e007ae8855aff18954d33f5e10e0dc82a9539577c325c5113af55f3d8d90588f')

package() {	
	cd "$srcdir/"

	install -Dm755 unum.pl "$pkgdir/usr/bin/unum" 
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
