# Contributor: Fabian Köhler <fabian2804@googlemail.com>
pkgname=boost-compute
pkgver=0.4
pkgrel=1
pkgdesc="A C++ GPU Computing Library for OpenCL"
arch=('i686' 'x86_64')
url="https://github.com/kylelutz/compute"
license=('boost')
depends=('boost')
makedepends=()
source=("https://github.com/kylelutz/compute/archive/v${pkgver}.tar.gz")
md5sums=('0d881bd8e8c1729559bc9b98d6b25a3c')

package() {
  mkdir -p "${pkgdir}/usr/include"
  cp -r compute-${pkgver}/include "${pkgdir}/usr/"
}

# vim: ft=sh syn=sh et
