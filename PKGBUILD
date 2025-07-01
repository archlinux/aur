# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=v0.1.1
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v0.1.1/cjvs_v0.1.1_linux_amd64.zip")
sha256sums=('8715dc3f395c66d615e00e959fa67e02dab30db808dc22671f2da875c608b444')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}