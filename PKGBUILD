# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.3
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
#source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('d1310907cdda14d3b5bbc93f39562c3999987b11504f7772969c3faf7d2808c2')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
