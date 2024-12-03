# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=GitQlient
pkgname=${_basename,,}-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="GitQlient: Multi-platform Git client written with Qt"
arch=('x86_64')
url="https://github.com/francescmm/GitQlient"
license=('GPL3')
conflicts=("${_basename,,}")
provides=("${_basename,,}")
makedepends=('tar')
depends=('git' 'qt5-base')
source=("https://github.com/francescmm/${_basename}/releases/download/v${pkgver}/${_basename,,}_${pkgver}_amd64.deb")
sha256sums=('e3a9a89fe52e257620bce64bfb59ce6e76c0606444d50eb20ff8189a3b8deaa2')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
} 
