# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle
softver=3.6
softrev=.0
pkgver=$softver$softrev
pkgrel=1
pkgdesc="Brewing assistant and beer recipe design"
arch=('any')
url="http://joliebulle.tuxfamily.org/"
license=('GPL3')
depends=('python' 'python-pyqt5')
source=("https://download.tuxfamily.org/joliebulle/$pkgname$softver/$pkgname-$pkgver.tar.gz")
sha256sums=('17b7104d3757054a1ccd9ed1c732472a053036893abbb07e96d2ee44764878a1')

package() {
  cd "$srcdir/Joliebulle-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
