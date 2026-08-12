# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('aarch64' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL-3.0-or-later' 'BSD-2-Clause')
provides=("optivorbis=$pkgver")
conflicts=('optivorbis')
source=("https://raw.githubusercontent.com/OptiVorbis/OptiVorbis/master/LICENSE.BSD-3-Clause")
source_aarch64=("https://github.com/OptiVorbis/OptiVorbis/releases/download/v$pkgver/OptiVorbis.CLI.aarch64-unknown-linux-musl.zip")
source_x86_64=("https://github.com/OptiVorbis/OptiVorbis/releases/download/v$pkgver/OptiVorbis.CLI.x86_64-unknown-linux-musl.zip")
sha256sums=('SKIP')
sha256sums_aarch64=('b6f195166035ce7e2ab42afed950faba28b97dd976787b5a400d2c42a8c0b8ac')
sha256sums_x86_64=('6f5793a4fb882954fbb183516d4c740679c81ca4eb99d625c852b5e3a01b9df7')


package() {
  install -Dm755 "$srcdir/optivorbis" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
