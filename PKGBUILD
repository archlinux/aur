# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>
#
pkgname=php-virtphp
pkgver=0.5.2
pkgrel=1
pkgdesc="virtPHP is a tool to create isolated PHP environments."
url="http://virtphp.org/"
license="MIT"
arch=("any")
depends=("php")
source=("https://github.com/virtphp/virtphp/releases/download/v${pkgver}-alpha/virtphp.phar")
sha512sums=('0fae39ab8e17705aa6209fcf88182dbf60b29259b2e49a9d81cf0c50d0deb8410735e07fff698b5f5d3b940b55d6290650404da4f68a15cc4e40412f36f26d72')

package() {
  install -D -m755 $srcdir/virtphp.phar $pkgdir/usr/share/webapps/bin/virtphp.phar

  install -d $pkgdir/usr/bin
  ln -s /usr/share/webapps/bin/virtphp.phar $pkgdir/usr/bin/virtphp
}

# vim:set ts=4 sw=2 et:
