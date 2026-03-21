pkgname=hyprtime-bin
pkgver=0.0.2
pkgrel=2
pkgdesc="minimal screen time tracker for hyprland (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/hyprtime"
license=('MIT')
depends=('webkit2gtk-4.1')
provides=('hyprtime' 'hyprtimed')
conflicts=('hyprtime' 'hyprtimed')

source=(
  "https://github.com/ayanrajpoot10/hyprtime/releases/download/v${pkgver}/hyprtime.tar.xz"
  "hyprtime.desktop"
)

sha256sums=('SKIP'
            'SKIP')

package() {
  install -Dm755 "$srcdir/hyprtime" \
    "$pkgdir/usr/bin/hyprtime"

  install -Dm755 "$srcdir/hyprtimed" \
    "$pkgdir/usr/bin/hyprtimed"

  install -Dm644 "$srcdir/hyprtime.desktop" \
  "$pkgdir/usr/share/applications/hyprtime.desktop"
}
