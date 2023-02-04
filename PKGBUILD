# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=isight-firmware
pkgver=1
pkgrel=1
pkgdesc="Non-free firmware for Built-in iSight found on Apple machines"
arch=("x86_64")
depends=("isight-firmware-tools")
url="https://archive.org/details/AppleUSBVideoSupport"
license=("unknown")
source=("https://archive.org/download/AppleUSBVideoSupport/AppleUSBVideoSupport")
sha256sums=("fe94c7b8c1d06e6632ef4ac35b4c8fafe5933635e8a330a7eac130c6d67b7d57")
makedepends=("isight-firmware-tools")

package() {
	install -d "${pkgdir}"/usr/lib/firmware/

	ift-extract --apple-driver "${srcdir}"/AppleUSBVideoSupport --output-directory="${pkgdir}"/usr/lib/firmware/
}