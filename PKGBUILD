# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.5
pkgrel=2
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python2')

makedepends=(
			'python2'
			'python2-docopt')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('ef1f64ca1df99240662622899d7216e9507e818e17f32a4d8143ff0da2e789b0')



package() {
   cd $srcdir/${pkgname}-${pkgver}
   python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
