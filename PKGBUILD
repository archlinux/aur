# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle
softver=3.7
softrev=.0
pkgver=$softver$softrev
pkgrel=1
pkgdesc="Brewing assistant and beer recipe design"
arch=('any')
url='http://joliebulle.org/'
license=('GPL3')
depends=('python' 'python-pyqt5' 'qt5-webkit')
source=("https://download.tuxfamily.org/joliebulle/$pkgname$softver/$pkgname-$pkgver.tar.gz")
source=("http://joliebulle.org/repository/$pkgname$softver/$pkgname-$pkgver.tar.gz")
sha256sums=('f349a4564ae1ff952ac12536dd2e61b2a05c6705482564e77fb37305f2a38e0a')

package() {
  cd "$srcdir/Joliebulle-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
