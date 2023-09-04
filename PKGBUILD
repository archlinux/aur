# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.24.1
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=(xorg)
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.24.1-2_amd64.deb")
sha256sums=('b1d25cf76c81db146e6c81acbc9a5d9ee3b2dcd1fc1b9102bb5edae21221ee99')

package() {
    bsdtar -O -xf qtum_0.24.1-2_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
