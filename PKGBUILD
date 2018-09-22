# Maintainer: Andrius Semionovas < aneworld at gmail dot com >

pkgname="vim-git-hunk-editor"
pkgver="1.0"
pkgrel="1"
pkgdesc="Very small plugin to  easily edit hunk patch by toggling lines"
arch=("any")
url="https://github.com/neworld/vim-git-hunk-editor"
license=("MIT")
depends=("vim")
source=("vim-git-hunk-editor-${pkgver}.tar.gz::https://github.com/neworld/vim-git-hunk-editor/archive/v${pkgver}.tar.gz")
sha256sums=("143288c3728bd7da9f305c8d30e0041d4405b8ffe98dbba6e9773337344ba1e5")

package() {
    cd "${srcdir}/vim-git-hunk-editor-${pkgver}" 
    install -Dm0644 plugin/git-hunk-editor.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/git-hunk-editor.vim"
}
