# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=adbyss
pkgname=${_basename}-bin
pkgver=0.23.3
pkgrel=1
pkgdesc="DNS blocklist manager"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('c8d68010613e7d311c3b65b29b9eead2758361e49fa2d4248db19132f15734a4')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
