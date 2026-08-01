# Maintainer: Omar <https://github.com/sazardev>
pkgname=shiki-bin
pkgver=0.8.10
pkgrel=1
pkgdesc="TUI note-taking app with a Yazi-inspired three-pane layout and git-backed notebooks"
arch=('x86_64')
url="https://github.com/sazardev/shiki"
license=('MIT')
provides=('shiki')
conflicts=('shiki')
source=("https://github.com/sazardev/shiki/releases/download/v${pkgver}/shiki-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5603815007c4830b0d7887b0f6b4ae51f9470c184e87e3c07a8d0c7e052ffe58')

package() {
  cd "shiki-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 shiki "${pkgdir}/usr/bin/shiki"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
