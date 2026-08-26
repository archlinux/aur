# Maintainer: chiconcota <git@github.com:chiconcota>
pkgname=fcitx5-lilypad-bin
_pkgname=fcitx5-lilypad
pkgver=2.3.0
pkgrel=1
pkgdesc="Modern, hyper-fast Vietnamese Telex/VNI Input Method for Fcitx5 (Wayland/X11) - Pre-compiled binary"
arch=('x86_64')
url="https://github.com/chiconcota/fcitx5-lilypad"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fmt' 'libinput' 'systemd-libs' 'python' 'python-qtpy' 'python-pyqt5')
provides=('fcitx5-lilypad')
conflicts=('fcitx5-lilypad' 'fcitx5-lilypad-git')
install=fcitx5-lilypad.install
source=("https://github.com/chiconcota/fcitx5-lilypad/releases/download/v${pkgver}/fcitx5-lilypad-v${pkgver}-x86_64-archlinux.tar.zst"
        "fcitx5-lilypad.install")
sha256sums=('7b8f4758d62363927276fd09c7fed7d6928e28d18c408d3918c82035db0f5836'
            '86c5c1b374ba83b5bee113b48f7cef110a499da35daa26801bcc4658eda2591b')

package() {
  cp -dr --no-preserve=ownership "$srcdir/usr" "$pkgdir/" 2>/dev/null || true
  cp -dr --no-preserve=ownership "$srcdir/lib" "$pkgdir/" 2>/dev/null || true
  cp -dr --no-preserve=ownership "$srcdir/etc" "$pkgdir/" 2>/dev/null || true
}
