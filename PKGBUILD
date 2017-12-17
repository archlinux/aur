# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('casefile')
pkgver=4.1.0.10552
_pkgver1=${pkgver%.*}
_pkgver2=$(echo ${_pkgver1%.*} | sed -r 's/\.//g')
pkgrel=1
pkgdesc="Offline intelligence application, allowing analysts to examine links between offline data"
arch=('any')
license=('custom')
url="https://www.paterva.com/web7/buy/maltego-clients/casefile.php"
depends=('java-environment=8')
optdepends=('perl')
source=(https://www.paterva.com/malv${_pkgver2}/maltego_v${pkgver}.deb)
sha256sums=('62c04216a7eb96895555c622565cdbafd17db3ba569712378be4ddabf695f63e')

package() {
 ar x "${srcdir}/maltego_v${pkgver}.deb"
 tar -C "${pkgdir}" -xzf "${srcdir}/data.tar.gz"
}
