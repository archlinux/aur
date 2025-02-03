# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname="yolk-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
provides=('yolk')
conflicts=('yolk')
source=("https://github.com/elkowar/yolk/releases/download/v${pkgver}/yolk_dots-${CARCH}-unknown-linux-gnu.tar.xz")
b2sums=('fccd02add3398252430029d00ada39d57cab95fa9421193f09460d8633484711a6911ed14d69a86c5445213b721f45f455a8590954fa6736950790c0f6f30d83')

package() {
  cd "${srcdir}"
  install -Dm755 "yolk_dots-${CARCH}-unknown-linux-gnu/yolk" -t "${pkgdir}/usr/bin/"
}
