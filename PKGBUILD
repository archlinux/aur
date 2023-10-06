# Maintainer: Garlicbreadwolfs 
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=obkey
pkgver=1.0
pkgrel=5
pkgdesc='Openbox Key Editor'
arch=('any')
url="https://github.com/nsf/obkey"
depends=('python2' 'pygtk')
license=('custom:MIT')
conflicts=('obkey-git')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8e62beeb921903bdebcba5a247dc5da43d03a110f78aea237c50bec5a73349530ad4adf8ff5284953ce15243e0ab87b53367eef3455586c5515596bea31c868e')


package() {
  cd "$srcdir"/$pkgname-$pkgver

  python2 setup.py install --root="$pkgdir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" 
}
