# Maintainer: Omar <https://github.com/sazardev>
pkgname=shiki-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="TUI note-taking app with a Yazi-inspired three-pane layout and git-backed notebooks"
arch=('x86_64')
url="https://github.com/sazardev/shiki"
license=('MIT')
provides=('shiki')
conflicts=('shiki')
source=("https://github.com/sazardev/shiki/releases/download/v${pkgver}/shiki-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5591ecba8ea9b2dfe04b8e4f9794be233d483eb547a6a81a17a69dda5dda297f')

package() {
  cd "shiki-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 shiki "${pkgdir}/usr/bin/shiki"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
