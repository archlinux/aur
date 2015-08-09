# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle
softver=3.4
softrev=.0
pkgver=$softver$softrev
pkgrel=1
pkgdesc="Brewing assistant and beer recipe design"
arch=('any')
url="http://joliebulle.tuxfamily.org/"
license=('GPL3')
depends=('python' 'pyqt')
source=("http://download.tuxfamily.org/joliebulle/$pkgname$softver/$pkgname-$pkgver.tar.gz")
sha256sums=('6bc13deab8c871cabcd652a2af6dd346d54446bdca43b6107a8f67adf7ba4e05')

package() {
  cd "$srcdir/Joliebulle-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
