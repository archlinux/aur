# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=riprip
pkgname=${_basename}-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="A specialized audio CD-ripper optimized for track recovery"
arch=('x86_64')
url="https://github.com/Blobfolio/riprip"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'libcdio')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('08a0edc57c309e7fa516285eae453b27f26aaf41f62d499db16b3e09c6477f98')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
