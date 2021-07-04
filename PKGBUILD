# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.20.3
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.20.3_amd64.deb")
sha256sums=('9aed8cb7ebfb04cb891d13f62ce9dcda19296ed8293a346f17302c2d2fde1b0c')

package() {
    bsdtar -O -xf qtum_0.20.3_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
