# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=minimap2-bin
pkgver=2.18
pkgrel=2
pkgdesc="Aligner for genomic and spliced nucleotide sequences"
arch=('x86_64')
url="https://lh3.github.io/minimap2/"
license=('MIT')
depends=('glibc' 'zlib')
provides=('minimap2')
conflicts=('minimap2')
source_x86_64=("https://github.com/lh3/minimap2/releases/download/v$pkgver/minimap2-${pkgver}_x64-linux.tar.bz2")
sha256sums_x86_64=('71de93c501ad5b36eeea3bed0cbfa3c4d380d169ed4ab9e4b3face5e4e422cab')


package() {
  cd "minimap2-${pkgver}_x64-linux"

  install -Dm755 "minimap2" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/minimap2"
}
