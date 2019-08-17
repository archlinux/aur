# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.org/apt/ubuntu/pool/main/q/qtum/qtum_0.18.0_amd64.deb")
sha256sums=('499aa24d322df7231413176c9bc51633420c9802debc16a5e0b248b2fd439098')

package() {
    bsdtar -O -xf qtum_0.18.0_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
