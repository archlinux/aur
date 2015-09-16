# Maintainer: q9 <qqqqqqqqq9 at gmeyer dot df-kunde dot org>
# Contributor: OmeGa <omega at mailoo dot org>
# Contributor: vti <viacheslav.t at gmail dot com>
# Contributor: Danny Navarro <j@dannynavarro.net>

pkgname=vim-yankring
_id=23487
pkgver=19.0
pkgrel=1
pkgdesc="Maintains a history of previous yanks, changes and deletes."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1234"
license=('GPL')
depends=('vim')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_id")
sha1sums=('6f4a6f89a70e5f22aba56aa70eb77ddb21396f33')

package() {
  cd "$srcdir"

  install -Dm644 plugin/yankring.vim \
    "$pkgdir/usr/share/vim/vimfiles-custom/$pkgname/plugin/yankring.vim"
  install -Dm644 doc/yankring.txt \
    "$pkgdir/usr/share/vim/vimfiles-custom/$pkgname/doc/yankring.txt"
}

# vim:set ts=2 sw=2 et:
