_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
depends=('libffi6')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('0e609744fcf17822c084960f087ffe1a0b31f5690d0443f8827d3639a9617e86')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
