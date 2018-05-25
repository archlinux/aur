# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.15.1
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('')
source=("http://repo.qtum.org/apt/qtum_0.15.1_amd64.deb")
sha256sums=('6a79fb7c89fe52908317cc407f01a30d97b206b6367728a1c866031de6ffb786')

package() {
    bsdtar -O -xf qtum_0.15.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
