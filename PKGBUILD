# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.5
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
# source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('5dfe163b7c2d56568c7692a8269abae1512459c47569211a99fb488604856171')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
