# Maintainer: "mikehash" Miguel Palencia mike@qtum.org


pkgname=qtum-core-aarch64-bin
pkgver=0.18.3
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('aarch64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/raspbian/pool/main/q/qtum/qtum_0.18.3_armhf.deb")
sha256sums=('45ed2e357e42a79e34250eefba619b021d8ac0a71a0128e03ce0f64e5b2d9935')

package() {
    bsdtar -O -xf qtum_0.18.3_armhf.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
