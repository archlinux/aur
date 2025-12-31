# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
#source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('5918d6c659e61fcb6fdf60758a8e2917344b46f2ac0cdc062149d1214c9268f3')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
