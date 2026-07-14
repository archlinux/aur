# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=riprip
pkgname=${_basename}-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="A specialized audio CD-ripper optimized for track recovery"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'libcdio')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('9d0b66af0386615fb2dae991babcaea9f9862720a5d9d37621d89b26ce044b41')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
