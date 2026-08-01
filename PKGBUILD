# Maintainer: emmgee
pkgname=omarchy-seq-paste-niri
pkgver=1.0.0
pkgrel=2
pkgdesc="Sequential copy/paste (FIFO clipboard) for niri, inspired by macOS Pastebot (niri port of omarchy-seq-paste)"
arch=(any)
url="https://github.com/emmgeede/omarchy-seq-paste"
license=(MIT)
depends=(wl-clipboard inotify-tools ghostty libnotify jq wtype)
provides=(omarchy-seq-paste)
conflicts=(omarchy-seq-paste)

package() {
  install -Dm755 "$startdir/omarchy-seq-paste" "$pkgdir/usr/bin/omarchy-seq-paste"
  install -Dm644 "$startdir/niri-bindings.kdl" "$pkgdir/usr/share/omarchy-seq-paste/niri-bindings.kdl"
  install -Dm644 "$startdir/niri-rules.kdl" "$pkgdir/usr/share/omarchy-seq-paste/niri-rules.kdl"
}
