_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.20.0
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
depends=('libffi')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('560e5411b932390258e33ee8aa13e7105156913ff5342b153a6c576ece425b8a')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
