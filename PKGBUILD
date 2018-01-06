# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Rohan Dhruva (rohandhruva at gmail dot com)

pkgname=php-docs
pkgver=7.0.1
pkgrel=1
pkgdesc="Set of HTML documentation for PHP."
arch=('any')
url="http://www.php.net/docs.php"
license=('PHP')
depends=()
options=('docs' '!strip')
source=(php_manual_en-$pkgver.tar.gz::http://www.php.net/distributions/manual/php_manual_en.tar.gz)
md5sums=('6486c9398e4f22148ea22034ccd2bf31')

package(){
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/doc/php/
  cp -rf php-chunked-xhtml "$pkgdir"/usr/share/doc/php/
}
