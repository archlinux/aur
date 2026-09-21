# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=riprip
pkgname=${_basename}-bin
pkgver=0.8.3
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
sha256sums_x86_64=('b3cf6ea5c8e90fa7e30a1a39fda1826e1adb3db245ed1ea03fcfe9037fb51197')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
