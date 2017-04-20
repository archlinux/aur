# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=nvflash
pkgver=5.278.0
pkgrel=1
pkgdesc="A tool to update the the firmware of Nvidia display adapters."
url="https://www.techpowerup.com/downloads/Utilities/BIOS_Flashing/NVIDIA/"
arch=('x86_64' 'i686')
license=('unknown')

source=("http://us1-dl.techpowerup.com/files/XjZcRzzwNqSjiCRcDHKevA/1492685708/nvflash_${pkgver}-linux.zip")
sha512sums=('758fefdecb551c684c27eecf1d696181ee8bf13dd94bafc19f190abd3305fcdf082393a670bafeee8df0cb7f636bc193030e1076d2d0a5208fed5cd19d4e072d')

package() {
	install -Dm755 "${srcdir}"/nvflash "${pkgdir}"/usr/bin/nvflash
}
