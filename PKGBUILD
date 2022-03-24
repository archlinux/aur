# Maintainer: Maxwell Pray <synthead@gmail.com>

_pluginname=projectionist
pkgname=vim-$_pluginname
pkgver=1.3
pkgrel=1
pkgdesc="Granular project configuration"
arch=("any")
url="https://github.com/tpope/vim-projectionist"
license=("custom:vim")
source=("https://github.com/tpope/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("c7cf3fb6583761f42ef86610f04065e31fbe208624be1e837a8336fc5f0cbe23")

package() {
  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  cp -r "$srcdir/$pkgname-$pkgver/"{plugin,autoload,doc} "$pkgdir/usr/share/vim/vimfiles"
}
