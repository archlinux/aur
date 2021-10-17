# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zigmod-bin
pkgver=81
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
  '309f75280db8e744c31b14dd442a0fd01ddef6452e8a3481d2eb63437d48eced'
)

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
