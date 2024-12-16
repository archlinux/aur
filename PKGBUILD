# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.27.1
pkgrel=4
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=(glibc)
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.27.1_amd64.deb")
sha256sums=('2df512d650c14ba6471a011a6aa3d97df7c342c5cd9d40be7ab40e6c987c6761')

package() {
    bsdtar -O -xf qtum_0.27.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
