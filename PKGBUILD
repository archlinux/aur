pkgname=treefetch
pkgver="v1.1.0"
pkgrel=1
pkgdesc="treefetch"
url="https://github.com/angelofallars/treefetch.git"
arch=("x86_64")
license=('MIT')
md5sums=("78a66bcd9cb8c4b94960200ae65621aa")
source=("https://github.com/angelofallars/treefetch/releases/download/${pkgver}/treefetch")

package() {
  # install "${pkgdir}/usr/bin"
  install -D "${srcdir}/treefetch" "${pkgdir}/usr/bin/${pkgname}"
  # chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
