# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=riprip
pkgname=${_basename}-bin
pkgver=0.7.0
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
sha256sums_x86_64=('d7a81721ed5c3b54ed7e7d1d25616adf18f9481219b8fcee9703b2fb90850534')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
