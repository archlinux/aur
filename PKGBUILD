_pkgname=glualint
pkgname=${_pkgname}-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="Linter for Garry's mod Lua."
arch=('x86_64')
_githubrepo="https://github.com/FPtje/GLuaFixer"
url=${_githubrepo}
license=('LGPL2.1')
source=("${_githubrepo}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('b176da96ab60b52868715fb0bcc8071d8699e9abc69a0129568ab26ad349aa16')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
