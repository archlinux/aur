# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=eaglemode
pkgname=${_basename}-bin
pkgver=0.96.4
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
sha256sums_x86_64=('2cfd779d93738f479bbba577a81238a0afab777bbfe94e9a7117d990f78b18de')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
} 
