# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=wiiudownloader-bin
pkgver=2.98
pkgrel=1
pkgdesc="Download encrypted Wii U files from Nintendo's official servers (prebuilt)"
arch=('x86_64')
url="https://github.com/Xpl0itU/WiiUDownloader"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'hicolor-icon-theme' 'libx11' 'gtk3' 'gdk-pixbuf2'
         'cairo' 'pango' 'fontconfig')
provides=('wiiudownloader')
conflicts=('wiiudownloader')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('5b2bd57e6531aee1774ca3b9acc70bc402eab585a2532a666f4484584412622e')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
