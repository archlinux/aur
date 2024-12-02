# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis-bin
pkgver=0.2.0
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
sha256sums_aarch64=('5b213faae025908b3174d327e2c81149e6f00ae084de44eab8e88441c2baa514')
sha256sums_x86_64=('229a2ce3ac5c7b6bb475e15c477926318dcd0fdcedc1bfa2a7eaa3f5a7511b9e')


package() {
  install -Dm755 "$srcdir/optivorbis" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
