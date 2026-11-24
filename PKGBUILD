# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jjfx-bin
pkgver=0.56.0
pkgrel=1
pkgdesc="TUI for Jujutsu workspaces and the coding agents editing them"
arch=('x86_64')
url="https://github.com/jarvvski/jjfx"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jjfx-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('494e8637ecd20fc515b6e2fd7b6996edbc8337a34b52443c978583680d561f87')

package() {
  install -Dm755 "bin/jjfx" "${pkgdir}/usr/bin/jjfx"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
