# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.20.1_amd64.deb")
sha256sums=('7b5fe6b7ee65866f70f9022cb890ed5fe8febdbe8f190e46f51cf538f3979ce9')

package() {
    bsdtar -O -xf qtum_0.20.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
