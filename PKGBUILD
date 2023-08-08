# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=qradiolink-bin
pkgver=0.8.9_1
pkgrel=1
pkgdesc='Multimode SDR transceiver for GNU radio'
arch=('x86_64')
url="http://qradiolink.org/"
_githuburl="https://github.com/qradiolink/qradiolink"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-multimedia' 'protobuf' 'libjpeg6-turbo' 'zeromq' 'qt5-base' 'libsndfile' 'glibc' 'opus' 'gcc-libs')
source=("${pkgname%-bin}-${_pkgver}.deb::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb")
sha256sums=('b8050fc8dd0787c45236920a2dd81d2d0c395ab239191f1ae6632994aa780350')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}