# Creator/Maintainer: Aditya Singh <sr.aditya.dev@gmail.com>
# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=hyprshot-gui
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple GTK-based GUI for Hyprshot, designed to provide an easy way to capture and manage screenshots on Hyprland."
arch=('x86_64')
url="https://github.com/s-adi-dev/hyprshot-gui"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'hyprshot')
makedepends=('git')
provides=("${pkgname}")

source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "src/hyprshot-gui" "$pkgdir/usr/bin/hyprshot-gui"
    install -Dm644 "src/hyprshot.desktop" "$pkgdir/usr/share/applications/hyprshot.desktop"
}
