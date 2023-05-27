_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.24.4
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.zip")
sha256sums=('072d70f2a2ef3075a1356a1ab6d02f8af7fa226bd5def5cf6b79166360765a3d')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
