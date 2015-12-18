# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=phpctags
pkgver=0.5.1
pkgrel=0
pkgdesc="An enhanced php ctags index generator"
arch=('x86_64' 'i686')
license=('GPLv2')
url=('https://packagist.org/packages/techlivezheng/phpctags')
depends=('php')
provides=('phpctags')
conflicts=()
optdepends=()

install=('phpctags.install')

source=("http://vim-php.com/phpctags/install/phpctags.phar")
sha256sums=('6e6c59cf0b45832dd5e3a01d2c6cfade5eeaad30daa46db48e74f2ecaa6fbaaa')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/php/conf.d"
  install phpctags.phar "$pkgdir/usr/bin/phpctags"
}

# vim:set ts=2 sw=2 et:
