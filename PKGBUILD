# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=v0.2.0
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v0.2.0/cjvs_v0.2.0_linux_amd64.zip")
sha256sums=('15d8d74f8e6c8ee6a9c6f19d2cf33ca17526b82ff918cc0aaa542078d3a2eb33')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
