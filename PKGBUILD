# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=lenovo-s20-30
pkgver=0.1.0
pkgrel=1
pkgdesc='Configuration to support netbook Lenovo S20-30'
url='https://bitbucket.org/raimar/lenovo-s20-30'
arch=(any)
license=('GPL2')
source=(
	lenovo_s20-30_blacklist.conf
	lenovo_s20-30_load.conf
)
sha256sums=('3451688ddadac8699546e68f41607a7436dd8e25f1c6e0fc5989561b07b526b5'
            '9639303ddce1ced0d42291cbd83ab546f02259dab8002a28d89ba98fc267eae6')

install=install

package() {
	install -Dm644 lenovo_s20-30_blacklist.conf "${pkgdir}/usr/lib/modprobe.d/lenovo_s20-30_blacklist.conf"
	install -Dm644 lenovo_s20-30_load.conf "${pkgdir}/usr/lib/modules-load.d/lenovo_s20-30_load.conf"
}
