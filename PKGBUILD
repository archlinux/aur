# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.16.2
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("http://repo.qtum.org/apt/qtum_0.16.2_amd64.deb")
sha256sums=('39c498bff8089c62b2cc0fdb5daeac2fc5ff007b0a5e30462cf8d77529d17367')

package() {
    bsdtar -O -xf qtum_0.16.2_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
