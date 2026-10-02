# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=guff
pkgname=${_basename}-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A simple SASS/SCSS compiler and CSS parser/minifier"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('e82357eaf9f7d6fd2c219605617e7e24d4107ee8a4754c2f0c6ebe627c9d4199')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
