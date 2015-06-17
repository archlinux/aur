# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-cryptsetup
pkgver=0.1.4
_tag=python-cryptsetup-python-cryptsetup-$pkgver-1
pkgrel=1
pkgdesc='Python bindings for Network Security Services (NSS)'
arch=(i686 x86_64)
license=(GPL)
url='http://git.fedorahosted.org/cgit/python-cryptsetup.git'
depends=(python2 cryptsetup)
source=(https://git.fedorahosted.org/cgit/python-cryptsetup.git/snapshot/$_tag.tar.xz)
sha1sums=('5b810d062b4e796e000666e5a70d0bdebf850fd2')

check() {
  cd $_tag
  python2 setup.py check
}

package() {
  cd $_tag
  python2 setup.py install --root="$pkgdir" --optimize=1
}
