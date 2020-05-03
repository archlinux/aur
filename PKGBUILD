# Maintainer: dreieck

pkgname=uksmd-openrc
pkgver=0.8
pkgrel=1
pkgdesc="OpenRC init script for uksmd"
arch=("any")
license=("GPL2")
depends=('uksmd')
optdepends=(
  'openrc: To actually make use of this initscript.'
)
install='uksmd-openrc.install'
source=(
  "uksmd.initd"
  "uksmd-openrc.install"
)
sha256sums=(
  '0047ef5549f18a848d61ace4fe9c397ea1e9d37414d13e2b8e067be2bce6a397'
  '7c97f08d0c101bf3d93f52c93ce9e376485df3b0dbb5253b3c24a2de20802d29'
)

package() {
  install -Dm755 "${srcdir}/uksmd.initd" "${pkgdir}/etc/init.d/uksmd"
}
