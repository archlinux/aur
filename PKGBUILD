# Maintainer: PawkyPenguin

_pkgname=vim-please-dont
pkgname=$_pkgname-git
pkgver=1.0
pkgrel=1
pkgdesc='A vim plugin that adds auto-indentation for deliberately poor style'
arch=('any')
url="https://github.com/PawkyPenguin/${_pkgname}"
license=('GPL3')
depends=('vim')
groups=('vim-plugins')
source=("git+https://github.com/PawkyPenguin/${_pkgname}.git")
sha256sums=('SKIP')
makedepends=('git')

package() {
    cd "${_pkgname}"

    local installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -D -m644 "plugin/please-dont.vim" "${installpath}/plugin/please-dont.vim"
}

