# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.4
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
#source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('540b2732b4a60c4982b6a3aa4cfb5125a6965904e51d6fb0bb251b4999ead305')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
