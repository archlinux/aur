# Maintainer: hzxiaxz <hzxiaxz at gmail dot com>
pkgname=koushi-matrix-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Koushi (光子・格子) — Matrix desktop client built on Tauri and matrix-rust-sdk (binary release)"
arch=('x86_64')
url="https://github.com/shinaoka/koushi-matrix"
license=('MIT OR Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus' 'libsecret' 'openssl' 'cairo' 'gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'org.freedesktop.secrets' 'hunspell' 'hunspell-dictionary')
provides=('koushi-desktop')
conflicts=('koushi-desktop')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Koushi-linux-x64.deb")
sha256sums=('9fe1e84a76ef933e55c702da33c4f313aa7e5db745b5de3c24170bae093c2df6')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  chmod -R go-w "$pkgdir/usr"
}
