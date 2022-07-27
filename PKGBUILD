_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.21.1
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('6f02428b8322002b1efb9fc55ae33456b3edbf80302e54eb6dac941bb8365f60')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
