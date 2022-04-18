# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=quad
pkgver=1.12
pkgrel=6
pkgdesc="High-performance file compressor that utilizes an advanced LZ-based compression algorithm"
arch=('i686' 'x86_64')
url=http://quad.sourceforge.net
license=('LGPL')
depends=('gcc-libs')
source=("https://sourceforge.net/projects/quad/files/QUAD/1.12/quad112src.zip")
sha256sums=('67e008e1ee6c164e711ababbbbddc0848e137b2fe73923f08c7b8b96bdff8c70')

build() {
  g++ -o quad quad.cpp
}

  
package() {
  install -Dm755 "$srcdir"/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir"/README.TXT "$pkgdir"/usr/share/doc/$pkgname/README.TXT
}
