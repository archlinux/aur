# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff-bin
pkgver=1.0.3
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
sha256sums=('f6130d86f0c2af5d2330f09de957035ce9da7f4e68c5a1157d20dbeb833a2f33')

package() {
  install -Dm755 "ytuff-linux-${CARCH}/ytuff" "$pkgdir/usr/bin/ytuff"
}
