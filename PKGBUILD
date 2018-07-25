# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.15.2
pkgrel=2
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("http://repo.qtum.org/apt/qtum_0.15.2_amd64.deb")
sha256sums=('6c3a59ba7e7e9acadad1df3218ef6c1886a9d2225f4b8d66deb862a4381ade52')

package() {
    bsdtar -O -xf qtum_0.15.2_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
