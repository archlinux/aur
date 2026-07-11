# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=cjvs-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="仓颉Cangjie版本切换工具"
arch=('x86_64')
url="https://github.com/ystyle/cjvs"
license=('MulanPSL2')
depends=('openssl')
provides=('cjvs')
conflicts=('cjvs')
source=("https://github.com/ystyle/cjvs/releases/download/v${pkgver}/cjvs_v${pkgver}_linux_amd64.zip")
# source=("cjvs_v${pkgver}_linux_amd64.zip")
sha256sums=('8fca6b58e78a39f45480b6a7842adda4a0365dc364cf939e590603d7fb32dd76')

package() {
  install -Dm755 cjvs "$pkgdir/usr/bin/cjvs"
}
