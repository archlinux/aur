# Maintainer: Jeremy <jeremyhuang55555@gmail.com>

pkgname=mmdr-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Fast Mermaid diagram renderer in pure Rust - 23 diagram types, 100-1400x faster than mermaid-cli"
arch=('x86_64')
url="https://github.com/1jehuang/mermaid-rs-renderer"
license=('MIT')
depends=('glibc')
provides=('mmdr')
conflicts=('mmdr')
source=(
  "mmdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v${pkgver}/mmdr-x86_64-unknown-linux-gnu.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/1jehuang/mermaid-rs-renderer/v${pkgver}/LICENSE"
)
sha256sums=(
  'aa5e2c5f39464e252efa6c654937348bf857003414e4fbf8229b5ac41dce23f7'
  '57ed7943c34463678a150769d4a4f6c95d2a190fe2c1977f74bc883492c94b86'
)

package() {
  install -Dm755 mmdr "${pkgdir}/usr/bin/mmdr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
