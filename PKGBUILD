# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Lucas Hoffmann <l-m-h at web dot de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Rohan Dhruva (rohandhruva at gmail dot com)
pkgname=php-docs
pkgver=7.4.0
pkgrel=1
pkgdesc="Set of HTML documentation for PHP."
arch=('any')
url="http://www.php.net/docs.php"
license=('PHP')
options=('docs' '!strip')
source=(php_manual_en-$pkgver.tar.gz::http://www.php.net/distributions/manual/php_manual_en.tar.gz)
# The upstream file changes every once in a while without a file name change.
# This is not the right but arguably the simplest solution:
sha256sums=(SKIP)

package(){
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/doc/php/
  cp -rf php-chunked-xhtml "$pkgdir"/usr/share/doc/php/
}
# vim:set ts=2 sw=2 et:
