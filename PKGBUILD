# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback-tray
pkgver=0.8.8
pkgrel=1
pkgdesc="System tray icon for tapeback (start/stop recording from tray)"
arch=('any')
url="https://github.com/yastcher/tapeback"
license=('Apache-2.0')
depends=('tapeback')
install=tapeback-tray.install

# Meta-package: dependencies installed via .install hook into /opt/tapeback/ venv.

package() {
    install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README" <<EOF
tapeback-tray: system tray icon for tapeback.
Pip dependencies installed into /opt/tapeback/ venv by install hook.
EOF
}
