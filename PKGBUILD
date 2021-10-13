pkgname=cmp-buffer
pkgver=5dde543
pkgrel=1
pkgdesc='nvim-cmp source for buffer words'
arch=('any')
url=https://github.com/hrsh7th/cmp-buffer
license=('')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plug' 'lua')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
package(){
    cd "${srcdir}/cmp-buffer"
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    cp -a lua "${pkgdir}/usr/share/nvim/runtime/"
    cp -a after "${pkgdir}/usr/share/nvim/runtime/"
}
pkgver(){
    cd "${srcdir}/cmp-buffer"
    git rev-parse --short HEAD
}
