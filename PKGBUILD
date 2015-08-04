# Contributor: Kosava <kosava@archlinux.us>

pkgname=dexter
pkgver=0.18
pkgrel=3
pkgdesc="Address Book that goes hand in hand with Postler"
arch=('i686' 'x86_64')
url="https://launchpad.net/dexter-rolodex"
license=('GPL')
depends=('python2-distutils-extra' 'python2-vobject' 'python2-storm' 'python2-pyenchant' 'python2-xdg')
makedepends=('python2')
provides=('dexter')
conflicts=('dexter-bzr')
source=(http://launchpad.net/$pkgname-rolodex/0.x/0.18/+download/dexter_$pkgver.tar.gz)
md5sums=('740a7781477afad1492f9aa362ff2cee')


package() {
   cd $srcdir/$pkgname-rolodex
   python2 setup.py install --prefix=/usr --root=$pkgdir
}
