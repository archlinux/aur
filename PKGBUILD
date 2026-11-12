# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=guff
pkgname=${_basename}-bin
pkgver=0.12.1
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
sha256sums_x86_64=('7e9a6c0cef6d5b099d2f84c099751a596bbec0449855d1f961bfc3a3dd165a14')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
