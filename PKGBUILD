# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=riprip
pkgname=${_basename}-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="A specialized audio CD-ripper optimized for track recovery"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('9fb5bcd7628107f17a07f917992913bb48e3d17d7e0f5bf250f8b879be874e7f')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
