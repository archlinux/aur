# Maintainer:
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=obkey
pkgver=1.0
pkgrel=4
pkgdesc='Openbox Key Editor'
arch=('any')
url="http://code.google.com/p/obkey"
depends=('python2' 'pygtk')
license=('GPL')
conflicts=('obkey-git')
replaces=('obkey-dev')
source=(https://github.com/nsf/obkey/archive/v${pkgver}.tar.gz)
md5sums=('41686cfe4708fe304a16163496fa05d8')


package() {
  cd "$srcdir"/$pkgname-$pkgver

  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
