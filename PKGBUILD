pkgname=germanium
pkgver=1.2.2
pkgrel=1
pkgdesc='Generate image from source code'
arch=('x86_64')
url="https://github.com/matsuyoshi30/germanium"
makedepends=()
source=("$url/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tar.gz")
md5sums=('54560e4a0f7dc5539f3035ae65a3912d')

package() {
  install -Dm755 ./${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
