# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=fyi
pkgname=${_basename}-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="A dead-simple CLI status message printer for use in BASH scripts, etc"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('abfc7ea70b09ca6d82f1f2da9c85d6918b023885b507f981ff1a9ea7846c8b1e')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
