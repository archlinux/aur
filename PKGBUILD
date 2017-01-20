# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=phpctags
pkgver=0.6.0
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

source=("https://github.com/vim-php/phpctags/archive/$pkgver.zip")
sha256sums=('0d995dc1c432b7b451b5e2cd03064047d5b30939f9b05b994a4630ea537a5afe')

package() {
  cd $pkgname-$pkgver
  ls -aslh
  make
  install -Dm755 build/phpctags.phar "$pkgdir/usr/bin/phpctags"
}

# vim:set ts=2 sw=2 et:
