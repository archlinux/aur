# Maintainer: emmgee
pkgname=omarchy-cmd-dictate
pkgver=1.0.0
pkgrel=1
pkgdesc="Voice-to-text dictation for Hyprland — press to record, press again to transcribe and type"
arch=(any)
url="https://github.com/emmgeede/omarchy-cmd-dictate"
license=(MIT)
depends=(whisper.cpp pipewire wtype libnotify)
source=("$pkgname-$pkgver.tar.gz::https://github.com/emmgeede/omarchy-cmd-dictate/archive/v$pkgver.tar.gz")
sha256sums=('66775d13e06b653c3a0d37db51111a139af40e268fbe39aa2d7f2a491894b302')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 omarchy-cmd-dictate "$pkgdir/usr/bin/omarchy-cmd-dictate"
  install -Dm644 hyprland-bindings.conf "$pkgdir/usr/share/omarchy-cmd-dictate/hyprland-bindings.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/omarchy-cmd-dictate/LICENSE"
}
