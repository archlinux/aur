# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.16
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("http://repo.qtum.org/apt/qtum_0.16_amd64.deb")
sha256sums=('d4d03e3df8f2139f72e22246f24900fe377885502c7ef3ae631bc7b771946e89')

package() {
    bsdtar -O -xf qtum_0.16_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
