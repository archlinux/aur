
pkgname=ccwatcher
pkgver=1.2.0
pkgrel=1
pkgdesc="A QT monitors the progress of computational chemistry calculations during runtime."
arch=(i686 x86_64)
url="http://opendesktop.org/content/show.php/ccwatcher?content=119644"
license=('GPL2')
depends=('python2>=2.4' 'gnuplot>=4')
optdepends=("pyqt>=4" "avogadro" "pyqwt>=5")
makedepends=('automoc4' 'cmake')
source=("http://heanet.dl.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.bz2")
md5sums=('dad007e9bd6c52b7e3a5093f34b5e189')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  python2 setup-all.py install --prefix'=/usr' --root="${startdir}/pkg"

}

