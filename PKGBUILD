# Maintainer: Jeremy <jeremyhuang55555@gmail.com>

pkgname=mmdr-bin
pkgver=0.3.0
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
  'a3f44bec7eefac178d6879966d4d067e0d17dbe5fae4ad2dba66651e5780e483'
  '57ed7943c34463678a150769d4a4f6c95d2a190fe2c1977f74bc883492c94b86'
)

package() {
  install -Dm755 mmdr "${pkgdir}/usr/bin/mmdr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
