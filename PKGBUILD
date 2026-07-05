# Maintainer: Oguz Kaganer Eren <oguzkaganeren@gmail.com>

pkgname=openrgb-ruler
pkgver=1.0.5
pkgrel=1
pkgdesc="GUI for automated RGB lighting control rules via OpenRGB"
arch=('x86_64')
url="https://github.com/oguzkaganeren/openrgb-ruler"
license=('GPL3')
depends=(
  'cairo'
  'dbus'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk4'
  'hicolor-icon-theme'
  'pango'
  'openrgb'
)
install=${pkgname}.install
source=("https://github.com/oguzkaganeren/openrgb-ruler/releases/download/v${pkgver}/openrgb-ruler-gtk-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('67e7d930b5604042e1c0cd14cf382ce78611563c84568b57a015802aa77f3b8e')

package() {
  install -Dm755 "${srcdir}/openrgb-ruler-gtk" \
    "${pkgdir}/usr/bin/openrgb-ruler-gtk"

  install -Dm644 "${srcdir}/openrgb-ruler-gtk.desktop" \
    "${pkgdir}/usr/share/applications/openrgb-ruler-gtk.desktop"

  install -Dm644 "${srcdir}/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openrgb-ruler.png"

  install -Dm644 "${srcdir}/icons/64x64.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/openrgb-ruler.png"

  install -Dm644 "${srcdir}/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openrgb-ruler.png"

  install -Dm644 "${srcdir}/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openrgb-ruler.png"
}
