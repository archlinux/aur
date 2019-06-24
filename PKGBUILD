# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.17.6
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.org/apt/ubuntu/pool/main/q/qtum/qtum_0.17.6_amd64.deb")
sha256sums=('78adc4d3b9dfb0992d80ead5e927e0452208b640759280bbc22b55c3759c3738')

package() {
    bsdtar -O -xf qtum_0.17.6_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
