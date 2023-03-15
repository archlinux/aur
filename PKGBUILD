_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.24.2
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.zip")
sha256sums=('aa652dce5f556d5e1b53666f561b0d366ab8c4be7bd23abd17588ef2c893c393')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
