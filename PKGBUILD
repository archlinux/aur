# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=fyi
pkgname=${_basename}-bin
pkgver=2.6.2
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
sha256sums_x86_64=('50ed3d7e02eef6ac023eb5a3da5d734998ebe22d07be587551d09edd3df2ff1f')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
