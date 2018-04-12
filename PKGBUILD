# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('casefile')
pkgver=4.1.6.11045
_pkgver1=${pkgver%.*}
_pkgver2=$(echo ${_pkgver1%.*} | sed -r 's/\.//g')
pkgrel=1
pkgdesc="Offline intelligence application, allowing analysts to examine links between offline data"
arch=('any')
license=('custom')
url="https://www.paterva.com/web7/buy/maltego-clients/casefile.php"
depends=('java-environment=8')
optdepends=('perl')
source=(https://www.paterva.com/malv${_pkgver2}/maltego_${pkgver}.deb)
sha256sums=('45c67827ba0871b7ddf4d224b6e3b4ca23e455472b385ee00affc5045d3ea818')

package() {
 ar x "${srcdir}/maltego_${pkgver}.deb"
 tar -C "${pkgdir}" -xzf "${srcdir}/data.tar.gz"
}
