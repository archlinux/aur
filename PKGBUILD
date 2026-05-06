# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal music player for local files and YouTube Music"
arch=('x86_64')
url="https://github.com/life2harsh/rustplayer"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'ffmpeg'
  'glib2'
  'glibc'
  'gtk3'
  'libgcc'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
provides=('ytuff')
conflicts=('ytuff')
source=("https://github.com/life2harsh/rustplayer/releases/download/v${pkgver}/rustplayer-linux-${CARCH}-arch.tar.gz")
sha256sums=('112476ff45880924512881c0501594d7f49bcd38bf6894df2398acc2a8414a06')

package() {
  install -Dm755 "rustplayer-linux-${CARCH}/rustplayer" "$pkgdir/usr/bin/rustplayer"
}
