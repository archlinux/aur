# Maintainer: Jesse Hills <3060199+jesserockz@users.noreply.github.com>
pkgname=esphome-desktop-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="ESPHome Device Builder desktop app (pre-built binary)"
arch=('x86_64')
url="https://github.com/esphome/esphome-desktop"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libpulse'
    'libsoup3'
    'libayatana-appindicator'
    'webkit2gtk-4.1'
)
conflicts=('esphome-desktop')
source=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/ESPHome.Device.Builder_${pkgver}_amd64.deb")
sha256sums=('33eb87b96d90cde26564b5fa6c2658ac064d4aaad96190c0ec8caf2e6e9da6ad')
options=('!strip')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
