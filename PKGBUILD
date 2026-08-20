# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=fyi
pkgname=${_basename}-bin
pkgver=2.7.0
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
sha256sums_x86_64=('54ded2e96f21d36d99ecaf6d89740a35c99b80124aa9135da666abab219e6d72')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
