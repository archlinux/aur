# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sean Greenslade <zootboysean@gmail.com>

pkgname=python2-rospkg
pkgver=1
pkgrel=1
pkgdesc="Rospkg"
arch=('any')
url='http://github.com/ros/rospkg/'
license=('Apache')
depends=('python2')
makedepends=('python2-distribute')
source=()
md5sums=()

build() {
  cd $srcdir
  git clone git://github.com/ros/rospkg.git
}

package() {
  cd ${srcdir}/rospkg
  python2 setup.py install --root=${pkgdir} || return 1
}
