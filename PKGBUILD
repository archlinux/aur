# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle
softver=3.7
softrev=.3
pkgver=$softver$softrev
pkgrel=2
pkgdesc="Brewing assistant and beer recipe design"
arch=('any')
url='https://joliebulle.org/'
license=('GPL3')
depends=('python' 'python-pyqt5' 'qt5-webkit')
source=("https://github.com/314r/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6627f13b9e4a1cef04dd6c4b08bde3842acf473d862bf6fe9b862a668fa86a2a')

package() {
  cd "$srcdir/Joliebulle-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
