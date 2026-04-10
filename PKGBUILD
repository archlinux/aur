# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
license=('MulanPSL2')
depends=('openssl' 'tar')
provides=('cjvs')
conflicts=('cjvs')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
#source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('2ab9e41f1dd6a7d10266d9be3871ba6a2508bd47eaef0637f781f9859edb0547')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
