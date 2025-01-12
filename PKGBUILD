# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-launcher
pkgver=1.2.8
pkgrel=1
pkgdesc="A simple and lightweight app for running Windows games using UMU-Launcher"
arch=('x86_64')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('python' 'python-gobject' 'python-requests' 'python-pillow' 'python-pynput' 'python-filelock' 'umu-launcher' 'imagemagick' 'icoextract' 'libayatana-appindicator' 'gamescope')
provides=('faugus-launcher')
conflicts=('faugus-launcher-git')
source=("https://github.com/Faugus/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 faugus-run.py "$pkgdir/usr/bin/faugus-run"
    install -Dm755 faugus-proton-manager.py "$pkgdir/usr/bin/faugus-proton-manager"
    install -Dm755 faugus-components.py "$pkgdir/usr/bin/faugus-components"
    install -Dm755 faugus-gamepad.py "$pkgdir/usr/bin/faugus-gamepad"
    install -Dm755 faugus-session "$pkgdir/usr/bin/faugus-session"
    install -Dm644 faugus-launcher.desktop "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-shortcut.desktop "$pkgdir/usr/share/applications/faugus-shortcut.desktop"
    install -Dm644 faugus-session.desktop "$pkgdir/usr/share/wayland-sessions/faugus-session.desktop"
    install -Dm644 assets/faugus-launcher.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-launcher.png"
    install -Dm644 assets/faugus-battlenet.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-battlenet.png"
    install -Dm644 assets/faugus-ea.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-ea.png"
    install -Dm644 assets/faugus-epic-games.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-epic-games.png"
    install -Dm644 assets/faugus-ubisoft-connect.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-ubisoft-connect.png"
    install -Dm644 assets/faugus-banner.png "$pkgdir/usr/share/faugus-launcher/faugus-banner.png"
}
