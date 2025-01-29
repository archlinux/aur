# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname="yolk-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
provides=('yolk')
conflicts=('yolk')
source=("https://github.com/elkowar/yolk/releases/download/v${pkgver}/yolk_dots-${CARCH}-unknown-linux-gnu.tar.xz")
b2sums=('0aeb31a5557eb7823f193ca56692af8ea3e95d3b3b6a4bb71b136a8199c7485c7bcf1d8a2237cf9ac464ce8ecdc17699f9209a87a4fcbb2472377485b43aaf82')

package() {
  cd "${srcdir}"
  install -Dm755 "yolk_dots-${CARCH}-unknown-linux-gnu/yolk" -t "${pkgdir}/usr/bin/"
}
