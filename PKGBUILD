# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=quick-send
pkgname=${_basename}-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Send files peer to peer"
arch=('x86_64')
url="https://github.com/israelyago/QuickSend"
license=('GPL3')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
source=("${url}/releases/download/app-v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums=('550de946c753776bb1a6deed2a2647b5a416f6da6a50cb6fc59c4101f5f533de')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
} 
