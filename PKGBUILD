pkgname=treefetch
pkgver="v1.2.0"
pkgrel=1
pkgdesc="A lightning-fast system fetch tool built with Rust."
url="https://github.com/angelofallars/treefetch.git"
arch=("x86_64")
license=('GPL3')
md5sums=("3dee14788296ddfa6ec0ea64b8db9fcf")
source=("https://github.com/angelofallars/treefetch/releases/download/${pkgver}/treefetch")

package() {
  install -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
