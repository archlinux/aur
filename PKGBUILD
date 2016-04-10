# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=joliebulle
softver=3.5
softrev=.0
pkgver=$softver$softrev
pkgrel=1
pkgdesc="Brewing assistant and beer recipe design"
arch=('any')
url="http://joliebulle.tuxfamily.org/"
license=('GPL3')
depends=('python' 'pyqt')
source=("https://download.tuxfamily.org/joliebulle/$pkgname$softver/$pkgname-$pkgver.tar.gz")
sha256sums=('08258b25e87cc8dd7459e42c0af84f87f43cc6a325cfb5e70e847a0c0c6fae95')

package() {
  cd "$srcdir/Joliebulle-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
