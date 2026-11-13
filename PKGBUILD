# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=htminl
pkgname=${_basename}-bin
pkgver=0.12.0
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
sha256sums_x86_64=('e7a89d852f366764aedb1f34f8b4a9424a4da323c456eedb9de52e3521a05a50')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
