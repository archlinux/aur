# Maintainer: Omar <https://github.com/sazardev>
pkgname=shiki-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="TUI note-taking app with a Yazi-inspired three-pane layout and git-backed notebooks"
arch=('x86_64')
url="https://github.com/sazardev/shiki"
license=('MIT')
provides=('shiki')
conflicts=('shiki')
source=("https://github.com/sazardev/shiki/releases/download/v${pkgver}/shiki-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('890230632d963fd94e8c69cd864e56d27b1009140319839db58feaba04972c2d')

package() {
  cd "shiki-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 shiki "${pkgdir}/usr/bin/shiki"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
