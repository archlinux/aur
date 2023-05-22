# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('aarch64' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL3' 'BSD')
provides=("optivorbis=$pkgver")
conflicts=('optivorbis')
source=("https://raw.githubusercontent.com/OptiVorbis/OptiVorbis/master/LICENSE.BSD-3-Clause")
source_aarch64=("https://github.com/OptiVorbis/OptiVorbis/releases/download/v$pkgver/OptiVorbis.CLI.aarch64-unknown-linux-musl.zip")
source_x86_64=("https://github.com/OptiVorbis/OptiVorbis/releases/download/v$pkgver/OptiVorbis.CLI.x86_64-unknown-linux-musl.zip")
sha256sums=('SKIP')
sha256sums_aarch64=('53e4dcedf966304897962d935fc63029ff4436c7acda8b20c856914b05f5b58e')
sha256sums_x86_64=('26cee18afde2741345f2212a062b7f86efe45a5936d21e844c1f456946377cdf')


package() {
  install -Dm755 "$srcdir/optivorbis" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
