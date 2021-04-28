# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
_pkgname=gitui
pkgver=0.15.0
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

sha256sums=('d06e06af905cd73df50f6a04074dbfd25a6d258740695cc2fffbdc9067df0c81')
