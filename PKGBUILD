# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.18.1
pkgrel=2
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.org/apt/ubuntu/pool/main/q/qtum/qtum_0.18.1_amd64.deb")
sha256sums=('eabd4af543046990ab4c52eb0f1e686ef9a97c4e9d4e783401fa6e70809dd51a')

package() {
    bsdtar -O -xf qtum_0.18.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
