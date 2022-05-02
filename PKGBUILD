_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('c5b6013ede2c69abdec2ebd1fdecdc2d18759bad3d7bb0a2c7ded2a86237acaf')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
