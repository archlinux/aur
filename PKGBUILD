# Maintainer: physkets <physkets // at // tutanota dot com>

_pkgname=vala.vim
pkgname=vim-vala-arrufat-git
pkgver='r1.0000000'
pkgrel=1
pkgdesc='Vim runtime files for Vala.'
arch=('x86_64')
url='https://github.com/arrufat/vala.vim'
license=('GPL')
provides=('vim-vala')
conflicts=('vim-vala')
source=("git+https://github.com/arrufat/vala.vim.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 "ftdetect/glsl.vim" -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
    install -Dm 644 "indent/glsl.vim" -t "${pkgdir}/usr/share/vim/vimfiles/indent"
    install -Dm 644 "syntax/glsl.vim" -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
}
