# Maintainer: Jesse Hills <3060199+jesserockz@users.noreply.github.com>
pkgname=esphome-desktop-bin
pkgver=0.10.1
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
sha256sums=('e4ed114d83fab9e17d2c5e47b4f871f5317a1e5f5590494bb4332d485a212fac')
options=('!strip')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
