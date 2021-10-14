pkgname=cmp-nvim-lsp
pkgver=f93a6cf
pkgrel=2
pkgdesc='nvim-cmp source for neovim builtin LSP client'
arch=('any')
url=https://github.com/hrsh7th/cmp-nvim-lsp
license=('')
groups=('neovim-plugins')
depends=('neovim' 'lua')
makedepends=('git')
optdepends=('neovim-plug: for plugin manager')
source=("git+${url}")
sha256sums=('SKIP')
package(){
    cd "${srcdir}/cmp-nvim-lsp"
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    cp -a lua "${pkgdir}/usr/share/nvim/runtime/"
    cp -a after "${pkgdir}/usr/share/nvim/runtime/"
}
pkgver(){
    cd "${srcdir}/cmp-nvim-lsp"
    git rev-parse --short HEAD
}
