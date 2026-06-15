# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=vim-jsx-pretty
pkgver=3.0.0
pkgrel=1
pkgdesc="Vim syntax highlighting for React JSX and TSX"
arch=('any')
url="https://github.com/MaxMEllon/vim-jsx-pretty"
license=('MIT')
depends=('vim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f92d53073c038ccc368bdb80a49146814c9f86c278bb03ea4160426e759f52ab')

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir/usr/share/vim/vimfiles"
  cp -r after autoload doc "$pkgdir/usr/share/vim/vimfiles/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
