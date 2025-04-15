# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=quick-send
pkgname=${_basename}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Send files peer to peer"
arch=('x86_64')
url="https://github.com/israelyago/QuickSend"
license=('Unlicense')
conflicts=("${_basename}")
provides=("${_basename}")
depends=('gcc-libs' 'glibc' 'glib2' 'hicolor-icon-theme' 'pango' 'cairo' 'openssl' 'webkit2gtk' 'gdk-pixbuf2' 'libsoup' 'gtk3')
makedepends=('tar')
source=("${url}/releases/download/app-v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums=('efa5bce7e4513328b47c4719b3427e0b75683d22feb73b186866113cc1abdecf')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
} 
