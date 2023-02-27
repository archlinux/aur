_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.24.1
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.zip")
sha256sums=('ad898db3fef1f41f9ad4b13f49a23e9f28fe3ec56752001d6c835163606caa9d')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
