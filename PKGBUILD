# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wgetpkg
pkgver=0.0.1
pkgrel=1
pkgdesc="Downloads AUR packages with wget"
arch=('any')
depends=('perl' 'wget')
url="https://github.com/atweiden/wgetpkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('69c43a20d879cac724a25d05ac27240702b581c4192307d920d79cb94b117b50')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 755 wgetpkg.pl "$pkgdir/usr/bin/wgetpkg"
}
