_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('4191f97dba9040662d15aad3947c4bfdbf6a17406c9e55181d8ebd57f8fe93e9')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
