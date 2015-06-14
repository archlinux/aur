# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 15/05/2011
pkgname=vim-matchit
_pkgname=matchit
pkgver=1.13.2
_pkgver=8196
pkgrel=2
pkgdesc="The matchit.vim script allows you to configure % to match more than just single characters"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=39"
license=('custom:vim')
groups=(vim-plugins)
depends=(vim-runtime)
install=${pkgname}.install
changelog=
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_pkgver}")
noextract=()

package() {
  cd "$srcdir/"
  install -Dm644 plugin/${_pkgname}.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/${_pkgname}.vim || return 1
  install -Dm644 doc/${_pkgname}.txt ${pkgdir}/usr/share/vim/vimfiles/doc/${_pkgname}.txt || return 1
}
sha256sums=('94c89edc419e115b333f4acc55ba4a3fd3cd76f2bcc6c69f9ae02cb8824475ad')
