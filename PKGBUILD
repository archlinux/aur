# Maintainer: Jesse Hills <3060199+jesserockz@users.noreply.github.com>
pkgname=esphome-desktop-bin
pkgver=0.12.3
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
sha256sums=('ca843e77c1bc2705dea66a068ab793ebf8ae7ca9c2487bd9930a32f24ed5a4ae')
options=('!strip')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
