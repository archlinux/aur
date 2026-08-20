# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=adbyss
pkgname=${_basename}-bin
pkgver=0.24.3
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
sha256sums_x86_64=('97c2ab8ee30d7bdb6246abc90413c1d0987a52a09f69b78f9d2529bdea960ae9')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
