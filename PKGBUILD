# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis-bin
pkgver=0.3.0
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
sha256sums_aarch64=('6885b50497fe5b1788909c3e7ad15a3be27336797fc7d1dd321a304c6e8d1303')
sha256sums_x86_64=('428547836500c387105354171dbc49e73f933064bbabd1be4b2dccac76f04353')


package() {
  install -Dm755 "$srcdir/optivorbis" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
