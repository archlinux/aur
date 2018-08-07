# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.15.3
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("http://repo.qtum.org/apt/qtum_0.15.3_amd64.deb")
sha256sums=('6a047dc7e1f571e33193f5816e2d10be0ad60f87327d7f15380b6cb37a2967ee')

package() {
    bsdtar -O -xf qtum_0.15.3_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
