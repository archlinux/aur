pkgname=ethtui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI for Ethernet status (Omarchy-style)"
arch=('x86_64')
url="https://github.com/skibidiandulka/ethtui"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=('ethtui')
conflicts=('ethtui' 'ethtui-git')
source=("ethtui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/ethtui-v${pkgver}-x86_64.tar.gz")
sha256sums=('ba8faea0de119606b6c1d027b3498a12f62fd1c75ff96168b88b29b841454dba')

package() {
  install -Dm755 "${srcdir}/ethtui-v${pkgver}-x86_64/ethtui" "${pkgdir}/usr/bin/ethtui"
  install -Dm644 "${srcdir}/ethtui-v${pkgver}-x86_64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ethtui-v${pkgver}-x86_64/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

