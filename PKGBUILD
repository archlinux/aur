# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=guff
pkgname=${_basename}-bin
pkgver=0.11.6
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
sha256sums_x86_64=('4a75e1c7d3b44e91813ada462dd977aa4c460128fd76a417d26defde233d5d1f')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
