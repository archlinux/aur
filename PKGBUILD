# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=phpctags
pkgver=0.5.1
pkgrel=1
pkgdesc="An enhanced PHP ctags index generator"
arch=('any')
license=('GPLv2')
url='https://packagist.org/packages/techlivezheng/phpctags'
depends=('php')
provides=('phpctags')
conflicts=()
optdepends=()

install='phpctags.install'

source=("http://vim-php.com/phpctags/install/phpctags.phar")
sha256sums=('6e6c59cf0b45832dd5e3a01d2c6cfade5eeaad30daa46db48e74f2ecaa6fbaaa')

package() {
  install -Dm755 phpctags.phar "$pkgdir/usr/bin/phpctags"
}

# vim:set ts=2 sw=2 et:
