# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=yesvgmap
pkgname=${_basename}-bin
pkgver=0.8.2
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
sha256sums_x86_64=('5056f1f87161e9cfade744fd0c824fc53d8d12bf409aba64fdf6fedbd23a3046')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
