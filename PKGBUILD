# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
pkgname=adlmidi
pkgver=1.2.6.2
pkgrel=1
pkgdesc="CLI MIDI player using OPL3 emulation"
url="https://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL3' 'GPL2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('sdl2')
makedepends=('git')
optdepends=('ffmpeg: recording output to video file')
source=("https://bisqwit.iki.fi/src/arch/adlmidi-${pkgver}.tar.bz2")
sha256sums=('eba5da4b568f4d994cf88c0d2057f4f1298c7aaf2230ba4ca5311cb765289a95')


build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/adlmidi" "$pkgdir/usr/bin/adlmidi"
}
