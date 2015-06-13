pkgname=vim-cmake-completion
pkgver=1.3
pkgrel=1
pkgdesc="Provides vim autocompletion for CMake files"
arch=('any')
url="https://github.com/richq/vim-cmake-completion"
license=('APACHE')
groups=('vim-plugins')
depends=('vim')
source=($url/archive/v${pkgver}.tar.gz)
md5sums=('a3beb4930c15edccdf71d7ac80b938ee')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles/"
  cp -a autoload plugin "$pkgdir/usr/share/vim/vimfiles/"
}
