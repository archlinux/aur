# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.1
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
#source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('fb6438b02521681cb64618d143cb4bdf45b08c51f01e460603b1cd7db1e5252e')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
