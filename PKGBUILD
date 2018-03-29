# Maintainer: "mikehash" Miguel Palencia mike@qtum.org
	


pkgname=qtum-qt
pkgver=0.14.15
pkgrel=3
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('GPL-3.0')
depends=('')
source=("http://repo.qtum.org/apt/qtum_0.14.15_amd64.deb")
sha256sums=('923cc9bfc5d5e3515ea1f05cae1a85dbad8bc2b2386ab51d89aa0ba79963d91c')

package() {
    bsdtar -O -xf qtum_0.14.15_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
