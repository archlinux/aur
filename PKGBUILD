# Maintainer: 0kalekale <kalekale.anon@gmail.com> - https://kalekale.ga

pkgname=python3-anilistpy
pkgver=0.1.0
pkgrel=2
pkgdesc="Easy to use python wrapper for anilist apiv2"
arch=('i686' 'x86_64')
url="https://github.com/anilistpy/anilistpy"
license=('AGPL3')
provides=('python3-anilistpy')
conflicts=('python3-anilistpy')
makedepends=('python' 'rust' 'python-pip')
source=('git+https://github.com/anilistpy/anilistpy.git')
md5sums=('SKIP')

prepare() {
  pip3 install setuptools wheel setuptools-rust requests
}

build() {
  cd anilistpy
}

package() {
  cd anilistpy
  python3 setup.py install --user
}
