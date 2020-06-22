# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.19.1_amd64.deb")
sha256sums=('7cbcddc68d02af53a8a9ffd09a0e15ef62cfd0cedbd33fffca5b05146a49b097')

package() {
    bsdtar -O -xf qtum_0.19.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
