# Contributor: Angelo Theodorou <encelo@gmail.com>
pkgname=pacstats
pkgver=0.1
pkgrel=1
pkgdesc="Statistical charts about pacman activity"
arch=('any')
url="http://pacstats.googlecode.com"
license=('GPL')
depends=('pygtk' 'python-matplotlib')
makedepends=('gettext')
source=(http://pacstats.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d25c7ca918110325a941b85091427ec7')

build() {
  cd $pkgname-$pkgver
  python setup.py install --root=$pkgdir --prefix=/usr
}
