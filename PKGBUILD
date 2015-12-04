# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=clonepkg
pkgver=0.0.1
pkgrel=1
pkgdesc="Clones AUR packages with Git"
arch=('any')
depends=('git' 'perl')
url="https://github.com/atweiden/clonepkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('48d0126b3e0da87b1da478415715b88a74009c383f528037ea7480765ce0044c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 755 clonepkg.pl "$pkgdir/usr/bin/clonepkg"
}
