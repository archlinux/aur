# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.18.2
pkgrel=2
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.18.2.2_amd64.deb")
sha256sums=('b508648d0040bb78e0759858a6e173b4204bbc3dcad0b931d9350e21701bcf20')

package() {
    bsdtar -O -xf qtum_0.18.2.2_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
