# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Rohan Dhruva (rohandhruva at gmail dot com)

pkgname=php-docs
pkgver=7.2.2
pkgrel=1
pkgdesc="Set of HTML documentation for PHP."
arch=('any')
url="http://www.php.net/docs.php"
license=('PHP')
options=('docs' '!strip')
source=(php_manual_en-$pkgver.tar.gz::http://www.php.net/distributions/manual/php_manual_en.tar.gz)
sha256sums=('5d67f0f1c1cbe869c883486fb16afbdd45ee2e32174d97efd9bbda2646309a7d')

package(){
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/doc/php/
  cp -rf php-chunked-xhtml "$pkgdir"/usr/share/doc/php/
}
# vim:set ts=2 sw=2 et:
