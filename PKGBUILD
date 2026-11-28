# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=muxie-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="TUI for tmux session management"
arch=('x86_64')
url="https://github.com/phanorcoll/muxie"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/muxie_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('c50c00cf0f3d951ca6c351d08aab1702fe40f0ae1abe0499a25c54ff73a48f4a')

package() {
  install -Dm755 "muxie" "${pkgdir}/usr/bin/muxie"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
