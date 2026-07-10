# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=yesvgmap
pkgname=${_basename}-bin
pkgver=0.8.6
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
sha256sums_x86_64=('febfac9b2c1bcbaef62fb083677f1df3a21b89af4ba8a963a95ad5c900cf614a')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
