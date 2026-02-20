# Maintainer: 1jehuang <jeremyhuang55555@gmail.com>

pkgname=jcode-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="AI coding agent with TUI — multi-model (Claude, OpenAI, OpenRouter), swarm coordination, 30+ tools"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('jcode')
conflicts=('jcode')
source=(
  "jcode-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/1jehuang/jcode/releases/download/v${pkgver}/jcode-linux-x86_64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/1jehuang/jcode/v${pkgver}/LICENSE"
)
sha256sums=(
  '58b60fe476f91560a5f65753141609fba176ef082feb46a5605b96bf5f81bf4d'
  '720443eee2efeda8f9f93a7a6a6f62763c17171106f60df58a35b8ea638fdf60'
)

package() {
  install -Dm755 jcode-linux-x86_64 "${pkgdir}/usr/bin/jcode"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
