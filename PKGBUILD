_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.19.1
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
depends=('libffi')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('5a3680daa0aac05938702f7d5e853ba3a4b91b189bb79cfae3bde5bd03dd7c6a')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
