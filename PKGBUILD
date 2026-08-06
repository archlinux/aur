pkgname=ytubic-9m2pju-bin
_pkgname=YTubic
pkgver=0.4.3
pkgrel=1
pkgdesc="A YouTube Music client built with Flutter"
arch=('x86_64')
url="https://github.com/NUber-dev/YTubic"
license=('GPL3')
provides=("ytubic")
conflicts=("ytubic")
source=("${_pkgname}-${pkgver}.deb::https://github.com/NUber-dev/YTubic/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.deb")
sha256sums=('17b5822d65b6090e6305c84257649bb5168084459ea1343e2cf9c10fde349be2')

prepare() {
    tar -xf data.tar.gz
}

package() {
    cp -dpr --no-preserve=ownership usr "${pkgdir}"/
}
