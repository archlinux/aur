# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=quick-send
pkgname=${_basename}-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Send files peer to peer"

url="https://github.com/israelyago/QuickSend"
arch=('x86_64')
license=('Unlicense')

conflicts=("${_basename}")
provides=("${_basename//-/}")

makedepends=('tar')
depends=('gcc-libs' 'glibc' 'glib2' 'hicolor-icon-theme' 'pango' 'cairo' 'openssl' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'libsoup' 'gtk3')

source=("${url}/releases/download/app-v${pkgver}/${_basename//-/}_${pkgver}_amd64.deb")
sha256sums=('1a826e1af606e582444ade7c4f9a06ccdebc6f896523c0a751cfbd8de95cfdca')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
} 
