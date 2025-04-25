# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=v0.0.16
pkgrel=1
epoch=
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
depends=('openssl')
license=('MulanPSL2')
source=("https://github.com/ystyle/cjvs/releases/download/v0.0.16/cjvs_v0.0.16_linux_amd64.zip")
sha256sums=('4f66c8bdaca82be006543799ac8bd62a8082d36efd6f838997250fb35b25b418')

package() {
    install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}