# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=minimap2-bin
pkgver=2.17
pkgrel=1
pkgdesc="Aligner for genomic and spliced nucleotide sequences"
arch=('x86_64')
url="https://lh3.github.io/minimap2/"
license=('MIT')
depends=('glibc' 'zlib')
provides=('minimap2')
conflicts=('minimap2')
source=("https://github.com/lh3/minimap2/releases/download/v$pkgver/minimap2-${pkgver}_x64-linux.tar.bz2")
sha256sums=('fe97310cf9abc165de2e17d41b68ee5a1003be3ff742179edef38fcf8a089a47')


package() {
  cd "minimap2-${pkgver}_x64-linux"

  install -Dm755 "minimap2" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/minimap2"
}
