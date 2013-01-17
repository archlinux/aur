# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ros-groovy-ros-pkg
pkgver=1
pkgrel=1
pkgdesc="Rospkg"
arch=('any')
url='http://github.com/ros/rospkg/'
license=('Apache')
depends=('python2')
makedepends=('setuptools')
source=()
md5sums=()

build() {
  cd $srcdir
  git clone git://github.com/ros/rospkg.git
  cd rospkg
  python2 setup.py install --root=${pkgdir} || return 1
}
