# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Rohan Dhruva (rohandhruva at gmail dot com)

pkgname=php-docs
pkgver=7.2.2
pkgrel=2
pkgdesc="Set of HTML documentation for PHP."
arch=('any')
url="http://www.php.net/docs.php"
license=('PHP')
options=('docs' '!strip')
source=(php_manual_en-$pkgver.tar.gz::http://www.php.net/distributions/manual/php_manual_en.tar.gz)
sha256sums=('ff0e34526e9e7a932f33d7930d8e15fcdec8337df248e651cf5e3a60d21cd091')

package(){
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/doc/php/
  cp -rf php-chunked-xhtml "$pkgdir"/usr/share/doc/php/
}
# vim:set ts=2 sw=2 et:
