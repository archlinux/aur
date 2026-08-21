pkgname=blit-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='High-performance file transfer CLI and daemon'
arch=('x86_64')
url='https://github.com/roethlar/Blit'
license=('MIT')
provides=('blit')
conflicts=('blit')
source=('https://github.com/roethlar/Blit/releases/download/v0.1.3/blit-x86_64-unknown-linux-gnu.tar.gz')
sha256sums=('6fb218db537a0e00a148327425705f075d876ffb012e725d0280af14fdd3c951')

package() {
  cd "blit-x86_64-unknown-linux-gnu"
  install -Dm755 blit "$pkgdir/usr/bin/blit"
  install -Dm755 blit-daemon "$pkgdir/usr/bin/blit-daemon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
