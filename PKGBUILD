# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=minimap2-bin
pkgver=2.19
pkgrel=1
pkgdesc="Aligner for genomic and spliced nucleotide sequences"
arch=('x86_64')
url="https://lh3.github.io/minimap2/"
license=('MIT')
depends=('glibc' 'zlib')
provides=('minimap2')
conflicts=('minimap2')
source_x86_64=("https://github.com/lh3/minimap2/releases/download/v$pkgver/minimap2-${pkgver}_x64-linux.tar.bz2")
sha256sums_x86_64=('2116ce7e517d8512e14c6e29a2a0ed951f53040ea530e7aa54382c7f66a4b0dc')


package() {
  cd "minimap2-${pkgver}_x64-linux"

  install -Dm755 "minimap2" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/minimap2"
}
