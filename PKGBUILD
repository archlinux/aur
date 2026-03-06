# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=yesvgmap
pkgname=${_basename}-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="CLI app for generating SVG sprite maps from any number of standalone SVG images."
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('cdd93aa678adecfe7222c40bf041fe62db740efaf981b483f4d64163382eed09')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
