# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
pkgname=textext
pkgver=0.4.4
pkgrel=3
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('i686' 'x86_64')
license=('BSD')
url="http://pav.iki.fi/software/textext/"
depends=('inkscape' 'texlive-core' 'python2-lxml' 'pdf2svg')
source=(http://pav.iki.fi/software/textext/$pkgname-$pkgver.tar.gz LICENSE.txt)
md5sums=('5dbb18bf762565196f8ac1f68f8607e3'
         '91da7de463147c1c78b1c2e6f24da380')
package() {
      cd "$srcdir"
      install -Dm 644 LICENSE.txt \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
      install -Dm 755 textext.py \
	"${pkgdir}/usr/share/inkscape/extensions/textext.py"
      install -Dm 644 textext.inx \
	"${pkgdir}/usr/share/inkscape/extensions/textext.inx"
    }
