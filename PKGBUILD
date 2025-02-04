# Maintainer: Charlotte Meyer <me@buffets.email>

pkgname="yolk-bin"
pkgver=0.2.2
pkgrel=1
pkgdesc="Templated dotfile management that won't get in your way"
arch=("x86_64")
url="https://elkowar.github.io/yolk/"
license=("MIT")
depends=("gcc-libs" "git" "glibc")
provides=('yolk')
conflicts=('yolk')
source=("https://github.com/elkowar/yolk/releases/download/v${pkgver}/yolk_dots-${CARCH}-unknown-linux-gnu.tar.xz")
b2sums=('752a2e4529bc922f9522a1785e6db982dd8636c41d4d810da00a112059fa0714f945ebd536d9963834a0f356c810bec9b562311512207b5568c333f95afeeaa7')

package() {
  cd "${srcdir}"
  install -Dm755 "yolk_dots-${CARCH}-unknown-linux-gnu/yolk" -t "${pkgdir}/usr/bin/"
}
