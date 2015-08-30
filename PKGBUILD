# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wgetpkg
pkgver=0.0.2
pkgrel=1
pkgdesc="Downloads AUR packages with wget"
arch=('any')
depends=('perl' 'wget')
url="https://github.com/atweiden/wgetpkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('81cb74bc78ea14583179e9639aad6ef707860a5890602b0ce86ca0d521f22c11')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 755 wgetpkg.pl "$pkgdir/usr/bin/wgetpkg"
}
