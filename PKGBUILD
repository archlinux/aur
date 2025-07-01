# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=v0.1.0
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v0.1.0/cjvs_v0.1.0_linux_amd64.zip")
sha256sums=('fa8cc48365a2d7f68f141413e24575d9c2e16b9ebdc9797c2a9f390d07ac17a2')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}