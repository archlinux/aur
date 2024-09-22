# Maintainer: Manos Vlassis <aur@mvlassis.com>

pkgname=dbibackend
pkgver=658
pkgrel=1
pkgdesc="A convenient method for installing games on your Nintendo Switch over USB"
arch=('any')
url="https://github.com/rashevskyv/dbi"
depends=("libusb" "python-pyusb" "tk")
source=("https://github.com/rashevskyv/dbi/releases/download/${pkgver}/dbibackend.tar.xz")
sha256sums=("13b3ddb34a0f9ad7f3c1d65279d07c03b816f041bdcfcd200406fa60a1e23aee")

package() {
	install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
