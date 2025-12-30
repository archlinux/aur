# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
#source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('6b07609100669f9e3259445f2481529956b992669e9d208bbc4d1d7758c7d737')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
