pkgname=treefetch
pkgver="v1.2.1"
pkgrel=1
pkgdesc="A lightning-fast system fetch tool built with Rust."
url="https://github.com/angelofallars/treefetch.git"
arch=("x86_64")
license=('GPL3')
md5sums=("c767dbb7ef831d405b7374d3997bcbac")
source=("https://github.com/angelofallars/treefetch/releases/download/${pkgver}/treefetch")

package() {
  install -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
