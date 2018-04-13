# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.14.16
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('')
source=("http://repo.qtum.org/apt/qtum_0.14.16_amd64.deb")
sha256sums=('f89e53448a8bc66080e40d3646b7b25679949b97b26d9e6cdf64b0ec8455fbcd')

package() {
    bsdtar -O -xf qtum_0.14.16_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
