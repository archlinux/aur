# Maintainer: Mohammed Efaz <mohammedefaz@gmail.com>
pkgname=liteparse-paddle-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI wrapper for local document parsing server (LiteParse + PaddleOCR)"
arch=('any')
url="https://github.com/WhiteHades/liteparse-paddle"
license=('Apache-2.0')
depends=('bash' 'curl' 'python')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 bin/lp-paddle "${pkgdir}/usr/bin/lp-paddle"
}
