# Maintainer: 7Ji <pugokughin@gmail.com>

pkgname=linux-firmware-amlogic-ophub
pkgver=20220916
pkgrel=1
pkgdesc="Firmware files for Linux - mainly for Amlogic platform, collected by ophub"
arch=('aarch64')
url="https://github.com/ophub/amlogic-s9xxx-armbian/raw/main/build-armbian/amlogic-armbian/firmware.tar.xz"
license=('GPL2' 'GPL3' 'custom')
provides=("linux-firmware=${pkgver}")
conflicts=('linux-firmware')
options=(!strip)
source=(
  "${url}"
)
sha256sums=(
  '0fe946da8ef60465b21356493c80481ec36f31e8e492ee816f2eeff999757e36'
)

package() {
  install -d -m 755 "${pkgdir}"/usr
  mv -v "${srcdir}/lib" "${pkgdir}/usr/"
}