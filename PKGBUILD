# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff-bin
pkgver=1.0.2
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
sha256sums=('8cdf118c7832df234ee7e5037073a6e5d02902d22bde525501971f667957b72c')

package() {
  install -Dm755 "ytuff-linux-${CARCH}/ytuff" "$pkgdir/usr/bin/ytuff"
}
