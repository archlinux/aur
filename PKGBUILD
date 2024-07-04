_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.29.0
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.zip")
sha256sums=('d6f962c224e8c89c186430656ed438415625524a34e3c42cd3d788d36d441e1e')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
