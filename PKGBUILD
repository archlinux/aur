# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=wiiudownloader-bin
pkgver=2.99
pkgrel=1
pkgdesc="Download encrypted Wii U files from Nintendo's official servers (prebuilt)"
arch=('x86_64')
url="https://github.com/Xpl0itU/WiiUDownloader"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'hicolor-icon-theme' 'libx11' 'gtk3' 'gdk-pixbuf2'
         'cairo' 'pango' 'fontconfig')
provides=('wiiudownloader')
conflicts=('wiiudownloader')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('1a43185b07869b8c25b71c3d43ddd829fd79af9d4cf6bfcfddb201f12cf8ff2e')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
