# Author: Caolan McMahon
# Contributor: Romain Beauxis (https://github.com/toots)
# Contributor: Alex Gorbatchev (https://github.com/alexgorbatchev)
# Contributor: Alex Wolfe (https://github.com/alexkwolfe)
# Contributor: Carl Fürstenberg (https://github.com/azatoth)
# Contributor: Gerad Suyderhoud (https://github.com/gerad)
# Contributor: Kadir Pekel (https://github.com/coffeemate)
# Contributor: Oleg Efimov (https://github.com/Sannis)
# Contributor: Orlando Vazquez (https://github.com/orlandov)
# Contributor: Ryan Dahl (https://github.com/ry)
# Contributor: Sam Stephenson (https://github.com/sstephenson)
# Contributor: Thomas Mayfield (https://github.com/thegreatape)
# Contributor: Elijah Insua <tmpvar@gmail.com> (http://tmpvar.com)
# Maintainer: caolan <caolan@caolanmcmahon.com>
# Maintainer: mreinstein <reinstein.mike@gmail.com>
_npmname=nodeunit
pkgname=nodejs-nodeunit # All lowercase
pkgver=0.9.0
pkgrel=1
pkgdesc="Easy unit testing for node.js and the browser."
arch=(any)
url="http://github.com/caolan/nodeunit"
license=(MIT)
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('0dfab188176c59de5373590f4197686941378351')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
