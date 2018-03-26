# Maintainer: "mikeqtum" Miguel Palencia mike@qtum.org


pkgname=qtum-qt
pkgver=0.14.15
pkgrel=1
pkgdesc="Qtum Desktop"
arch=('x86_64')
url="https://qtum.org"
license=('custom')
depends=('')
source=("http://repo.qtum.info/apt/qtum_0.14.15_amd64.deb")
sha256sums=('35cca2527de5f09d6e8b8661fec8b067f6eb84d2cd1d71cc7671084f85521ea5')

package() {
    bsdtar -O -xf qtum_0.14.15_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

}
