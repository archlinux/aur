# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=htminl
pkgname=${_basename}-bin
pkgver=0.11.7
pkgrel=1
pkgdesc="CLI tool that simplifies the task of minifying HTML in-place for production environments"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('7a52229d031aa8437ae4473f5b7a7a1bbdaecc41ac55c9b8d5a62afdee808b9b')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
