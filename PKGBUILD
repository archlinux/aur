# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname="yolk-bin"
pkgver=0.3.1
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
provides=('yolk')
conflicts=('yolk')
source=("https://github.com/elkowar/yolk/releases/download/v${pkgver}/yolk_dots-${CARCH}-unknown-linux-gnu.tar.xz")
b2sums=('3254fc8adf88247f97337c70b9701558fc05bc0124c8f144efdf91573b760c17628cec4c47904cb39376ea1692bbc366cc137daf56090a6fc244798606a03c8d')

package() {
  cd "${srcdir}"
  install -Dm755 "yolk_dots-${CARCH}-unknown-linux-gnu/yolk" -t "${pkgdir}/usr/bin/"
}
