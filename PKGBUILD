# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=fyi
pkgname=${_basename}-bin
pkgver=2.6.1
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
sha256sums_x86_64=('4fd9266171946a33856a0084930c533b3f8c2381c1927fdfe502eb46016600e3')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
