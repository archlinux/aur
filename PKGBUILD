# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=capter
pkgname=${_basename}-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="A simple cross-platform screenshot tool made in rust"
arch=('x86_64')
url="https://github.com/decipher3114/capter"
license=("Apache-2.0")
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=("gdk-pixbuf2" "gtk3" "xdotool" "libxtst" "glibc" "libx11" "libxcb" "gcc-libs" "pango" "hicolor-icon-theme" "glib2" "cairo" "dbus")
source=("https://github.com/decipher3114/Capter/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums=('85db09af89dbee0c984682d74a4013712a3288ae5cb9b8f8a8a20763020d1699')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
} 
