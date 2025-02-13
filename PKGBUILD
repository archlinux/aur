# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname="yolk-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
provides=('yolk')
conflicts=('yolk')
source=("https://github.com/elkowar/yolk/releases/download/v${pkgver}/yolk_dots-${CARCH}-unknown-linux-gnu.tar.xz")
b2sums=('1af775f84440585cb074ef3ea268f33041a1457e8c0517fd393a9e139aeac8745d1f1f8f4affb9e259e502bced998b0d6b4c7fcf88eef8ce1a5de4e1f0c8a5c7')

package() {
  cd "${srcdir}"
  install -Dm755 "yolk_dots-${CARCH}-unknown-linux-gnu/yolk" -t "${pkgdir}/usr/bin/"
}
