# Maintainer: mirkobrombin <send@mirko.pm>

pkgname=hid-asus-rog-dkms
pkgver=20201002
pkgrel=1
pkgdesc='DKMS installable module for ASUS ROG laptops'
arch=('x86_64')
url='https://github.com/mirkobrombin/hid-asus-rog-dkms'
license=('GPL3')
depends=(dbus libusb)
makedepends=('git')

source=(https://gitlab.com/asus-linux/hid-asus-rog.git)
sha512sums=('SKIP')

package() {
	cd "${srcdir}/hid-asus-rog-dkms"
	make dkms
}
