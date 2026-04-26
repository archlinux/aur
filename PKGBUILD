# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
license=('MulanPSL2')
depends=('openssl' 'tar')
provides=('cjvs')
conflicts=('cjvs')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
# source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('9789e0ca6922acc0353d985dbc7de0f4a5d4256980490853f202e82406b521ba')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
