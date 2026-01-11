pkgname=jasmine-wallpaper
pkgver=1.0.2
pkgrel=1
pkgdesc="GTK wallpaper helper for matugen + swww"
arch=("any")
url="https://github.com/xo-xo-xo-xo/jasmine-wallpaper"
license=("unknown")
depends=("python" "python-gobject" "gtk3" "gdk-pixbuf2" "matugen" "swww")
optdepends=("python-cairo: smoother sparkle rendering")
source=("$url/archive/refs/tags/$pkgver.zip")
sha256sums=("6a7a27300290cb9a652f9553476d33be800302fcb11cc8ba22f18326112324e1")

package() {
  install -Dm755 "$startdir/src/jasmine.py" "$pkgdir/usr/bin/jasmine-wallpaper"

  install -Dm644 "$startdir/assets/jasmine.ttf" \
    "$pkgdir/usr/share/jasmine-wallpaper/assets/jasmine.ttf"
  install -Dm644 "$startdir/assets/jasmine.svg" \
    "$pkgdir/usr/share/jasmine-wallpaper/assets/jasmine.svg"

  install -Dm644 "$startdir/jasmine-wallpaper.desktop" \
    "$pkgdir/usr/share/applications/jasmine-wallpaper.desktop"
  install -Dm644 "$startdir/assets/jasmine.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/jasmine-wallpaper.svg"
}
