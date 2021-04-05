# Maintainer: lmartinez-mirror
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
pkgname=vim-visual-multi
pkgver=0.5.8
pkgrel=2
pkgdesc='Multiple cursors plugin for vim/neovim'
arch=('any')
url='https://github.com/mg979/vim-visual-multi'
license=('MIT')
depends=('vim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6fe2345306c751ab9f84ff5f99ba77a79d0db391d38992904b40f0abc538dbc7')

package() {
  cd "$pkgname-$pkgver"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

