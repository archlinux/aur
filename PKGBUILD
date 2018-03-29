# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.14.15.1
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('')
source=("http://repo.qtum.org/apt/qtum_0.14.15.1_amd64.deb")
sha256sums=('fb3b3b7e39fec883dce2bc14dc249d89a2a97663378dd982ce73a58ef018290a')

package() {
    bsdtar -O -xf qtum_0.14.15.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
