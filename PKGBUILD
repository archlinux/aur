# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.23.1-2_amd64.deb")
sha256sums=('30e04dfae2152ef9ea832e937ac5d52aa19c6084d516afb2965301851c6f236f')

package() {
    bsdtar -O -xf qtum_0.23.1-2_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
