# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=nvflash
pkgver=5.227.0.1
pkgrel=1
pkgdesc="A tool to update the the firmware of Nvidia display adapters."
url="https://www.techpowerup.com/downloads/Utilities/BIOS_Flashing/NVIDIA/"
arch=('x86_64' 'i686')
license=('unknown')

source=("http://us1-dl.techpowerup.com/Utilities/BIOS_Flashing/NVIDIA/nvflash_${pkgver}-linux.zip")
sha512sums=('6d71818e3a7c979305b65f55246bda50db882707db4a945a01b174991eae1031a403494fee40e6e7656eb633f93620ea69ea791d2563f755427c39615828f7d0')

package() {
	install -Dm755 "${srcdir}"/x86/nvflash "${pkgdir}"/usr/bin/nvflash
}
