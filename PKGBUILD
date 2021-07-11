# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zigmod-bin
pkgver=51
pkgrel=1
pkgdesc="A package manager for the Zig programming language"
url="https://github.com/nektro/zigmod"
license=('MIT')
arch=('x86_64')
provides=('zigmod')
conflicts=('zigmod')
source=(
  "${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/zigmod-x86_64-linux"
)
sha256sums=(
  '9878d891d7d3ab47580b08f31bf6fbdb0382ba3f4edb7d413bf83ce51f548ec4'
)

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
