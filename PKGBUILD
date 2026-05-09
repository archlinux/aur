# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Terminal music player for local files and YouTube Music"
arch=('x86_64')
url="https://github.com/life2harsh/ytuff"
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
source=("https://github.com/life2harsh/ytuff/releases/download/v${pkgver}/ytuff-linux-${CARCH}-arch.tar.gz")
sha256sums=('bcc52d508f3d5cfc0d3b80ac6971ee7fc14193084aa81128f7dc82d982e1fe8c')

package() {
  install -Dm755 "ytuff-linux-${CARCH}/ytuff" "$pkgdir/usr/bin/ytuff"
}
