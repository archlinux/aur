# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=adbyss
pkgname=${_basename}-bin
pkgver=0.24.0
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
sha256sums_x86_64=('5036e3a8b2dd8d093984cc12f0accb83161f64e81340bb2b6b124dd899d903a8')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
