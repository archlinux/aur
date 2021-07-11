# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
_pkgname=gitui
pkgver=0.16.2
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2')
provides=("gitui")
conflicts=('gitui' 'gitui-git')
source=(
  https://github.com/extrawurst/gitui/releases/download/v${pkgver}/${_pkgname}-linux-musl.tar.gz
)
package(){
  install -Dm755 ${srcdir}/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

sha256sums=('01f2b68afb564d7ba49d0ada17499249df05f2ddf0f272c8ed81ef401495dd1c')
