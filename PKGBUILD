# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('casefile')
pkgver=2.1.1.8751
_pkgver1=${pkgver%.*}
_pkgver2=`echo ${_pkgver1} | sed -r 's/\.//g'`
pkgrel=1
pkgdesc="Offline intelligence application, allowing analysts to examine links between offline data"
arch=('any')
license=('custom')
url="https://www.paterva.com/web7/buy/maltego-clients/casefile.php"
depends=('java-environment=8')
optdepends=('perl')
source=(https://www.paterva.com/cf${_pkgver2}/MaltegoCaseFile.v${pkgver}.zip)
sha256sums=('47dee52ad0e09273976001fad4f85dea352504008c1d35d3961ba69d5fa4e350')

package() {
 cp -a "${srcdir}/MaltegoCaseFile_${_pkgver1}"/src/* "${pkgdir}/"
 chmod -x "${pkgdir}"/usr/share/applications/*
}
