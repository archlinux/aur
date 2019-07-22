# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.17.6.1
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.org/apt/ubuntu/pool/main/q/qtum/qtum_0.17.6.1_amd64.deb")
sha256sums=('71e39b50362d4fa776fbc2d1de2925f47787edadba60201b61a72e38f255e6ce')

package() {
    bsdtar -O -xf qtum_0.17.6.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
