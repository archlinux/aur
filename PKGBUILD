# Maintainer: KarlFiabeschi 1984itsnow[at]gmail[dot]com

pkgname=amzsear
pkgver=2.0.1
pkgrel=1
pkgdesc="The unofficial Amazon search CLI & Python API"
arch=('any')
url="https://github.com/asherAgs/amzSear"
license=('MIT')
depends=('python-lxml' 'python-cssselect')
source=("https://pypi.io/packages/source/a/amzsear/amzsear-$pkgver.tar.gz"
		"https://raw.githubusercontent.com/asherAgs/amzSear/master/LICENSE.txt")
sha1sums=('cedc9f1b9074c64af8f260e34ba5e962a75a2c8d'
		  '190228073b1334f12fde5c93e96678d08140b126')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "$srcdir"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
