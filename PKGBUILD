# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=htminl
pkgname=${_basename}-bin
pkgver=0.11.6
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
sha256sums_x86_64=('03831d6bc7f2d65f2e91615050f8a98f90ce443391fbb538e662a1bb0bd92bfc')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
