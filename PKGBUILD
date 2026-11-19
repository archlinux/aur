# Maintainer: Omar <https://github.com/sazardev>
pkgname=shiki-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="TUI note-taking app with a Yazi-inspired three-pane layout and git-backed notebooks"
arch=('x86_64')
url="https://github.com/sazardev/shiki"
license=('MIT')
provides=('shiki')
conflicts=('shiki')
source=("https://github.com/sazardev/shiki/releases/download/v${pkgver}/shiki-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('6b11b20b2687c5610a8fb869ef106d275a44acdd85045235b3906e945dff822e')

package() {
  cd "shiki-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 shiki "${pkgdir}/usr/bin/shiki"
  install -Dm755 shiki-mcp "${pkgdir}/usr/bin/shiki-mcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
