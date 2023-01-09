# Author Aktov Co <info@rutoken.ru>
# Maintainer: Mikhail Isaev <admin@ismv.ru>
pkgname=ifd-rutokens
pkgver=1.0.4
pkgrel=1
pkgdesc="Aktiv Co Rutoken S driver. Allows users to access Rutoken S through pcsc-lite."
arch=('x86_64')
url="https://www.rutoken.ru/support/download/nix/"
license=('custom')
groups=('')
depends=('glibc>=2.3.2' 'libusb-compat>=0.1.8')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://download.rutoken.ru/Rutoken/Drivers_Unix/${pkgver}/Linux/x64/${pkgname}_${pkgver}_amd64.deb")
sha512sums_x86_64=('7e7733bfa16838a69d9361366a73062231f31feca0f8ea3ae155b78f08014c2fe4ea2d147dcfc58ae2ba4afaaa14be55e6efd34b87586d1ded488d4267dba984')

package() {

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
