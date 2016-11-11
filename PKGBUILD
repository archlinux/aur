# Maintainer:  jjpk <julienjpk@email.com>
# Contributor: Fabian Köhler <fabian2804@googlemail.com>
pkgname=boost-compute
pkgver=0.5
pkgrel=1
pkgdesc="A C++ GPU Computing Library for OpenCL"
arch=('i686' 'x86_64')
url="https://github.com/kylelutz/compute"
license=('boost')
depends=('boost')
makedepends=()
source=("https://github.com/kylelutz/compute/archive/v${pkgver}.tar.gz")
md5sums=('69a52598ac539d3b7f6005a3dd2b6f58')

package() {
  mkdir -p "${pkgdir}/usr/include"
  cp -r compute-${pkgver}/include "${pkgdir}/usr/"
}
