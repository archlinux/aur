# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.16.1
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("http://repo.qtum.org/apt/qtum_0.16.1_amd64.deb")
sha256sums=('8c831a7f83d5dd8b2e9cb81dbe5da97ae7e3b86c5c07e8ad3e0df41d256d5c9c')

package() {
    bsdtar -O -xf qtum_0.16.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
