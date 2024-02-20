# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.24.1
pkgrel=4
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=(glibc)
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.24.1-4_amd64.deb")
sha256sums=('6cbd98e8119a2b90597e8a16b58cd71b42253d0663bf975260051bc200c2b09d')

package() {
    bsdtar -O -xf qtum_0.24.1-4_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
