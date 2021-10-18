_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.18.3
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
depends=('libffi')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('b8133493649fc1d7bd6504e0146a3ba55ec17b62f5e90f93b7e9a15afac876ac')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
