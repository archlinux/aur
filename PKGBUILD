# Maintainer: chiconcota <git@github.com:chiconcota>
pkgname=fcitx5-lilypad-bin
_pkgname=fcitx5-lilypad
pkgver=2.3.1
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
sha256sums=('a5b8be121fabd1bb00519921c77981f791608ae320574dcfcaae4dcef4fe2996'
            'a759df030c122306410f01750b82af66994d32e44a3e2d70352f0c65f411bf17')

package() {
  cp -dr --no-preserve=ownership "$srcdir/usr" "$pkgdir/" 2>/dev/null || true
  cp -dr --no-preserve=ownership "$srcdir/lib" "$pkgdir/" 2>/dev/null || true
  cp -dr --no-preserve=ownership "$srcdir/etc" "$pkgdir/" 2>/dev/null || true
}
