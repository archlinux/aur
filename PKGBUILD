# Maintainer: Wellzenon <https://github.com/wellzenon>
pkgname=cosmic-ext-niri-windows-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Window list applet for COSMIC panel with Niri window manager integration (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/wellzenon/cosmic-ext-niri-windows"
license=('GPL-3.0-or-later')
depends=('cosmic-panel' 'niri')
provides=('cosmic-ext-niri-windows')
conflicts=('cosmic-ext-niri-windows')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/cosmic-ext-niri-windows-v$pkgver-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "target/release/cosmic-ext-niri-windows" "$pkgdir/usr/bin/cosmic-ext-niri-windows"
    install -Dm644 "data/io.github.wellzenon.CosmicExtNiriWindows.desktop" "$pkgdir/usr/share/applications/io.github.wellzenon.CosmicExtNiriWindows.desktop"
    install -Dm644 "data/io.github.wellzenon.CosmicExtNiriWindows.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.wellzenon.CosmicExtNiriWindows.metainfo.xml"
    install -Dm644 "data/io.github.wellzenon.CosmicExtNiriWindows.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.wellzenon.CosmicExtNiriWindows.svg"
}
