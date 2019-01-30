# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum
pkgver=0.17.1
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('glibc')
source=("https://repo.qtum.org/apt/ubuntu/pool/main/q/qtum/qtum_0.17.1_amd64.deb")
sha256sums=('d07e155756b8b11489484919d0f0edceee32af0e1da816cb9b4f6b4a54cb142f')

package() {
    bsdtar -O -xf qtum_0.17.1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
