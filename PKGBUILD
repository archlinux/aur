# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=elicit
pkgver=2.2
pkgrel=1
pkgdesc="A GTK color chooser with zoom."
arch=('any')
url="http://rephorm.com/code/elicit/"
license=('GPL')
depends=('pygtk' 'python2-numpy' 'gnome-python' 'python2-xdg')
source=("http://rephorm.com/files/$pkgname/${pkgname}_${pkgver}.tar.gz")
md5sums=('14f6cd58cb34e2d02738b6c53d715a7b')

build() {
  cd "${pkgname}_${pkgver}"

  python2 setup.py build
}

package() {
  cd "${pkgname}_${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}


