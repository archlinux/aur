# Maintainer: solnce <c29sbmNlQHJhdGFqY3phay5vbmUK>
_commit=325a1298b0c9d8a4c61388a2f9956a534a9068cd
_date=20190511
pkgname=nerdtree-git-plugin
pkgver="${_date}_${_commit}"
pkgrel=1
pkgdesc='A plugin of NERDTree showing git status flags'
arch=('any') 
url='https://github.com/Xuyuanp/nerdtree-git-plugin'
license=('unknown')
depends=('vim-nerdtree')
makedepends=('git')
source=("git+https://github.com/Xuyuanp/nerdtree-git-plugin.git#commit=${_commit}")
sha512sums=('SKIP')            

package() {
  cd "${srcdir}/${pkgname}/nerdtree_plugin"
  install -d -m755 "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -m644 git_status.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
}

# vim:set et sw=2 ts=2 tw=79:
