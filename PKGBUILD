pkgname=blit-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='High-performance file transfer CLI and daemon'
arch=('x86_64')
url='https://github.com/roethlar/Blit'
license=('MIT')
provides=('blit')
conflicts=('blit')
source=('https://github.com/roethlar/Blit/releases/download/v0.1.2/blit-x86_64-unknown-linux-gnu.tar.gz')
sha256sums=('72fa993947c3a86287e49ab6c585f592e30185c0e18355f7e9b217d5ccbf922b')

package() {
  cd "blit-x86_64-unknown-linux-gnu"
  install -Dm755 blit "$pkgdir/usr/bin/blit"
  install -Dm755 blit-daemon "$pkgdir/usr/bin/blit-daemon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
