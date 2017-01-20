# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=grumpy
pkgver=0.aa58aa68
pkgrel=1
pkgdesc='Grumpy is a Python to Go source code transcompiler and runtime'
arch=('x86_64' 'i686')
url='https://github.com/google/grumpy'
depends=('go' 'python2')
makedepends=('go' 'python2' 'git')
license=('Apache')
options=('!strip')
source=("git+https://github.com/google/grumpy.git#commit=${pkgver#*.}")
md5sums=('SKIP')

build() {
  make -C grumpy -j2
}

package() {
  DESTDIR="$pkgdir" make -C grumpy install
}

# vim:set ts=2 sw=2 et:
