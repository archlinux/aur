# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.19.0.1
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.19.0.1_amd64.deb")
sha256sums=('4de9c4bf1c511b1bcfe2513e34e089ac238c0de8680b335edbee8f3090183ae4')

package() {
    bsdtar -O -xf qtum_0.19.0.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
