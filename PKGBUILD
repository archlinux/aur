pkgname=treefetch
pkgver="v1.2.0"
pkgrel=1
pkgdesc="treefetch -xmas"
url="https://github.com/angelofallars/treefetch.git"
arch=("x86_64")
license=('MIT')
md5sums=("3dee14788296ddfa6ec0ea64b8db9fcf")
source=("https://github.com/angelofallars/treefetch/releases/download/${pkgver}/treefetch")

package() {
  install -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
