# Maintainer: Scott R. Santos <halocaridina at gmail.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>
# Contributor: Thanasis Georgiou <sakisds@gmx.com>
# Contributor: PyroDevil <p dot devil at gmail dot com>

pkgname=ppub
pkgver=1.1
pkgrel=3
pkgdesc="Simple epub reader written using python, gtk3 and webkit"
arch=('any')
license=('GPL2')
url="https://github.com/sakisds/pPub"
depends=('python2' 'gtk3' 'gobject-introspection' 'libwebkit3'
         'python2-gobject')
makedepends=('git' 'make')
source=("git+https://github.com/sakisds/pPub.git#commit=3d1686070f34c125e266b22a346f320a47691103")
md5sums=('SKIP')

build() {
  cd pPub

  make ppub
}

package() {
  cd pPub

  make PREFIX="$pkgdir/usr" install
}
