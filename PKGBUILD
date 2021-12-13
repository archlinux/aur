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
  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/treefetch" "${pkgdir}/usr/bin/treefetch"
  chmod +x "${pkgdir}/usr/bin/treefetch"
}
