# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-core-bin
pkgver=0.20.1
pkgrel=3
pkgdesc="Qtum Desktop Binary release"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.info/apt/ubuntu/pool/main/q/qtum/qtum_0.20.1-2_amd64.deb")
sha256sums=('d52482aa2f115b00968e56195cc78ed4ba689816444e221f98ff0a5bd8037866')

package() {
    bsdtar -O -xf qtum_0.20.1-2_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf - 
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
