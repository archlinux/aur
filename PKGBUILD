# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jj_tui-bin
pkgver=0.22
pkgrel=1
pkgdesc="Terminal UI for the Jujutsu version control system"
arch=('x86_64')
url="https://github.com/faldor20/jj_tui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/faldor20/jj_tui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jj_tui-linux-x86_64.tar.gz")
sha256sums=('ee6c801f2f6f36d410a229e992791be72a3c57fe914e1cf6bdfeca57bf2fdf0e')
sha256sums_x86_64=('e29e75a5f3a88e3eb098e0d2a0ea0572644e0923938402bb5e28b9cc1757c2b8')

package() {
  install -Dm755 "jj_tui" "${pkgdir}/usr/bin/jj_tui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
