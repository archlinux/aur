# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle
softver=3.7
softrev=.1
pkgver=$softver$softrev
pkgrel=1
pkgdesc="Brewing assistant and beer recipe design"
arch=('any')
url='http://joliebulle.org/'
license=('GPL3')
depends=('python' 'python-pyqt5' 'qt5-webkit')
source=("http://joliebulle.org/repository/$pkgname$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3889ceaf87a43678bd8d5078f40e80087c072d24a198540078cf7411289bd72e')

package() {
  cd "$srcdir/Joliebulle-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
