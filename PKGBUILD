_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.23.0
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.zip")
sha256sums=('a53f704b8c82f6127dfd9d971e42cd3afb7ee3ab4356323839580bd97f8e9e55')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
