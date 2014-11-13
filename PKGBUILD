# Contributor: Fabian Köhler <fabian2804@googlemail.com>
pkgname=boost-compute
pkgver=0.3
pkgrel=1
pkgdesc="A C++ GPU Computing Library for OpenCL"
arch=('i686' 'x86_64')
url="https://github.com/kylelutz/compute"
license=('boost')
depends=('boost')
makedepends=()
source=("https://github.com/kylelutz/compute/archive/v${pkgver}.tar.gz")
md5sums=('7b070d95f06c0dc41e4952a0a4113561')

package() {
  mkdir -p "${pkgdir}/usr/include"
  cp -r compute-${pkgver}/include "${pkgdir}/usr/"
}

# vim: ft=sh syn=sh et
