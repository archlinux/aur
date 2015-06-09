# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=hdaps_lenovo-w520
pkgver=1.0
pkgrel=1
pkgdesc="hdaps configuration for Lenovo W520"
arch=(any)
url="http://none/"
license=(GPL)
depends=(tp_smapi)
backup=(etc/modprobe.d/hdaps.conf)
source=(hdaps.conf)
sha512sums=('990c51f9c4e8129e0bec72b248569d9f657142315cf003a0d7ce95f3e295ad24d07dbe53e6c147ba2aff563104c9f509059db06e68f035828830938f00631605')

package() {
  install -dm755 "${pkgdir}/etc/modprobe.d/"
  install -m644 hdaps.conf "${pkgdir}/etc/modprobe.d/"
}
