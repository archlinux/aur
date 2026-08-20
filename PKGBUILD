# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=yesvgmap
pkgname=${_basename}-bin
pkgver=0.8.7
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
sha256sums_x86_64=('5e3ac3d967ccd04d2807c693b4091f2df7e8505af222e819a724bed8eee3dc06')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
