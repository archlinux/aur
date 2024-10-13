# Maintainer: FerrousInk <ferrousink-aur@proton.me>
pkgname=power-buttons
pkgver=1.0.0
pkgrel=1
pkgdesc="Adds poweroff, reboot and suspend buttons to the applications folder"
arch=('any')
url="https://github.com/ferrousink/power-buttons"
license=('MIT')
depends=('systemd')
source=("https://ferrousink.github.io/power-buttons/power-buttons.tar.xz")
sha256sums=('SKIP')

package() {
    mkdir -p /usr/share/applications
    sudo install -Dm644 "$srcdir/poweroff.desktop" "/usr/share/applications/poweroff.desktop"
    sudo install -Dm644 "$srcdir/reboot.desktop" "/usr/share/applications/reboot.desktop"
    sudo install -Dm644 "$srcdir/suspend.desktop" "/usr/share/applications/suspend.desktop"
}
