# Maintainer: David Campbell <davekong@archlinux.us>
pkgname=cparted
pkgver=0.1
pkgrel=2
pkgdesc="Curses based disk partition manipulation program"
arch=('any')
url="https://github.com/davekong/cparted"
license=('GPL')
install=cparted.install
depends=('python2' 'python2-pyparted')
conflicts=('cparted-git')
options=(!emptydirs)
source=("https://github.com/dcampbell24/cparted/archive/cparted-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd cparted-cparted-0.1

  python2 setup.py build_scripts -e "/usr/bin/env python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
