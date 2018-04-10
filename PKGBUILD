# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=nord-vim
pkgver=0.8.0
pkgrel=1
pkgdesc="An arctic, north-bluish clean and elegant Vim theme"
arch=("any")
url="https://github.com/arcticicestudio/nord-vim"
license=("Apache", "CC-BY-SA-4.0")
depends=("vim")
makedepends=("git")
source=("$pkgname::git+https://github.com/arcticicestudio/nord-vim.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "colors/nord.vim" "$pkgdir/usr/share/vim/vimfiles/colors/nord.vim"
}
