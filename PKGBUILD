# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname='python-cairosvg'
pkgver=1.0.16
pkgrel=1
pkgdesc="A Simple SVG Converter for Cairo"
arch=('any')
url="http://cairosvg.org/"
license=('LGPL3')
source=("http://pypi.python.org/packages/source/C/CairoSVG/CairoSVG-${pkgver}.tar.gz")
makedepends=('python')
depends=('python' 'python-cairo')
md5sums=('e343cedaae2b23de52b2ce37160c16c1')


package() {
  cd "$srcdir/CairoSVG-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
