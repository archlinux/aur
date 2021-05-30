# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
_pkgname=gitui
pkgver=0.16.0
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

sha256sums=('521a9c981fd63f6453ae81bf66f9b3cccfb61c6814fef12748695306d809fed4')
