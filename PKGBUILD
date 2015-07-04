# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgname=python2-linux-procfs
pkgver=0.4.8
pkgrel=1

pkgdesc="Linux /proc abstraction classes for python"
url="https://git.fedorahosted.org/git/python-linux-procfs.git"
arch=('any')
license=('GPL')

depends=('python2')
makedepends=('git')

source=("$pkgname::git://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git")
sha256sums=('SKIP')

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --skip-build --root="$pkgdir"
}
# vim:set ts=2 sw=2 et:
