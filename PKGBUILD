# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-cryptsetup
pkgver=0.1.4
pkgrel=2
pkgdesc='Python bindings for Network Security Services (NSS)'
arch=(i686 x86_64)
license=(GPL)
url='http://git.fedorahosted.org/cgit/python-cryptsetup.git'
depends=(python2 cryptsetup)
# very unlikery to receive any updates in future
source=(https://src.fedoraproject.org/repo/pkgs/python-cryptsetup/python-cryptsetup-0.1.4.tar.gz/9455d264032342e322bbcce7ce5697d9/python-cryptsetup-0.1.4.tar.gz)
sha1sums=('6159cd8a2cf7190cbd0f6c9a3cbf0369753f35dd')

build() {
  cd python-cryptsetup-0.1.4
  python2 setup.py build
}

check() {
  cd python-cryptsetup-0.1.4
  python2 setup.py check
}

package() {
  cd python-cryptsetup-0.1.4
  python2 setup.py install --root="$pkgdir" --optimize=1
}
