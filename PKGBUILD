# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=nord-vim-lightline
pkgver=0.18.0
pkgrel=1
pkgdesc="An arctic, north-bluish clean and elegant Vim lightline theme"
arch=("any")
url="https://github.com/arcticicestudio/nord-vim"
license=("MIT")
depends=("vim")
makedepends=("git")
source=("$pkgname::git+https://github.com/arcticicestudio/nord-vim.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "autoload/lightline/colorscheme/nord.vim" "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/nord.vim"
}
