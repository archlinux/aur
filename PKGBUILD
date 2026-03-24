# Maintainer: 0x4A4FRN <dfntlynotjon@gmail.com>

pkgname=zigmod-bin
pkgver=r99
pkgrel=1
epoch=1
pkgdesc="A package manager for the Zig programming language"
url="https://github.com/nektro/zigmod"
license=('MIT')
arch=('x86_64')
provides=('zigmod')
conflicts=('zigmod')
source=(
  "${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/zigmod-x86_64-linux"
)
sha256sums=('bab680b2b3021f9f4c46e5a1fd5075de09ce06b74f8ef1054d2a1ad0c8256d97')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
