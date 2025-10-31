# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=htminl
pkgname=${_basename}-bin
pkgver=0.11.2
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
sha256sums_x86_64=('1050ac9ed1a8940d36602821580919c9f8bebf204a5abdebafdb1f17939217aa')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
