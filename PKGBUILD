# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
license=('MulanPSL2')
depends=('openssl' 'tar')
provides=('cjvs')
conflicts=('cjvs')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('dd56f9f934ebfa03da2f50448fc835b1757b08337f01c297f5565b55631e950a')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
