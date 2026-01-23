# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=guff
pkgname=${_basename}-bin
pkgver=0.11.1
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
sha256sums_x86_64=('8193f4fcf25eab4abf328d6aac9b0afece6cd95e06f0b81257bab11270492e40')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
