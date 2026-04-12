# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.8
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
sha256sums=('ec82ebad053c69c39b97f0a285f432b5ed032025c8b2d61dfa6dd7bf231d03f7')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
