# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis-bin
pkgver=0.1.4
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
sha256sums_aarch64=('ed607538f20f6ba81dceddfa412a3e2b7cea336ba1e4d850f63cab1e7c674041')
sha256sums_x86_64=('a63a165ee8cbfe7f39ebb263a12197337e359db5c72ff1a8d2f87d391895c24a')


package() {
  install -Dm755 "$srcdir/optivorbis" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
