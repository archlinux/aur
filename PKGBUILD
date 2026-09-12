# Maintainer: Dionicio3 (dionicio3@dionicio3.com)
pkgname=magewell-usb-capture-utility-bin
pkgver=3.0.5.48315
pkgrel=1
pkgdesc="Capture utility for Magewell USB capture cards"
arch=("x86_64")
url="https://www.magewell.com/downloads/usb-capture"
license=('unknown')
depends=('libusb>=1.0.0')
provides=('usbcaptureutility')
source=('https://www.magewell.com/files/tools/USBCaptureUtility3_deb_48315.zip')
sha256sums=('633c4b467a2fd0d81fcd840a29e12b039de76b1b9c75b6961bed29ff43150e74')

package() {
	bsdtar -xf "${srcdir}"/USBCaptureUtility3_deb_48315/usbcaptureutility_3.0.5.48315Internal.deb
	bsdtar -xf data.tar.xz -C "${pkgdir}"
	chmod -R 755 "${pkgdir}"
}