# Maintainer: emmgee
pkgname=omarchy-seq-paste
pkgver=1.0.0
pkgrel=1
pkgdesc="Sequential copy/paste (FIFO clipboard) for Hyprland, inspired by macOS Pastebot"
arch=(any)
url="https://github.com/emmgeede/omarchy-seq-paste"
license=(MIT)
depends=(wl-clipboard inotify-tools ghostty libnotify hyprland)
source=("$pkgname-$pkgver.tar.gz::https://github.com/emmgeede/omarchy-seq-paste/archive/v$pkgver.tar.gz")
sha256sums=('5a7d3c7efd6eb63de54f24871dd288c2ab6d03778b74617dd9d0406e86e92e34')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 omarchy-seq-paste "$pkgdir/usr/bin/omarchy-seq-paste"
  install -Dm644 hyprland-bindings.conf "$pkgdir/usr/share/omarchy-seq-paste/hyprland-bindings.conf"
  install -Dm644 hyprland-rules.conf "$pkgdir/usr/share/omarchy-seq-paste/hyprland-rules.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/omarchy-seq-paste/LICENSE"
}
