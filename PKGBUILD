# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.17.3
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.org/apt/ubuntu/pool/main/q/qtum/qtum_0.17.3_amd64.deb")
sha256sums=('0c666e0f15c941a50509550ce6ee4053ed422c92b35ba9d94770724811e279ad')

package() {
    bsdtar -O -xf qtum_0.17.3_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
