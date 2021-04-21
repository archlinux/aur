# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
_pkgname=gitui
pkgver=0.14.0
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2')
provides=("gitui")
conflicts=('gitui' 'gitui-git')
source=(
  # https://github.com/dotiful/AUR/raw/master/gitui-bin/gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar
  https://github.com/extrawurst/gitui/releases/download/v${pkgver}/${_pkgname}-linux-musl.tar.gz
)
package(){
  install -Dm755 ${srcdir}/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

sha256sums=('73a6a8e8944b129c35b0bffdad90a60b06b4709aa0a694db1b577ca5cb200918')
