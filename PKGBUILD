# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=eaglemode
pkgname=${_basename}-bin
pkgver=0.96.3
pkgrel=1
pkgdesc="Visit almost everything in your PC simply by zooming in"
arch=('x86_64')
url="http://eaglemode.sourceforge.net/"
license=('GPL-3.0-only')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('poppler-glib' 'glib2' 'glibc' 'freetype2' 'gcc-libs' 'gtk2' 'cairo' 'libtiff' 'libpng' 'librsvg' 'libwebp' 'libjpeg6-turbo' 'libvlc' 'libx11' 'bash' 'perl' 'htmldoc' 'vlc' 'xz' 'xdg-utils' 'desktop-file-utils' 'hicolor-icon-theme')
source_x86_64=("https://downloads.sourceforge.net/${_basename}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('b594d98d8966ddb678ce6355e85d565a8f37fff53689b6bd5dbe7eb9b8333869')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
} 
