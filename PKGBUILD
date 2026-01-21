# Maintainer: dom1torii <https://domitori.xyz>

pkgname=yasp
pkgver=0.1.0
pkgrel=1 
pkgdesc='Cross-platform TUI CS2 server picker written in Go'
arch=(x86_64)
license=(MIT)
url="https://github.com/dom1torii/yet-another-server-picker"
depends=(iptables)
_archive="yet-another-server-picker_Linux_x86_64"
source=("$_archive.tar.gz::$url/releases/download/$pkgver/$_archive.tar.gz"
        "yasp.desktop"
        "icon-256.png")
sha256sums=('eb7381240c4b161bdae03ff03a84e43675000258750471926b997f6552835904'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "$srcdir/yasp" "$pkgdir/usr/bin/yasp"
  install -Dm644 "$srcdir/yasp.desktop" "$pkgdir/usr/share/applications/yasp.desktop"
  install -Dm644 "$srcdir/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/yasp.png"
}

