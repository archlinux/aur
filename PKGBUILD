# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Joekey joekey1@gmail.com
pkgname=trigger-data
pkgver=0.6.2
pkgrel=1
pkgdesc="Data component of trigger"
arch=('any')
url="http://sourceforge.net/projects/trigger-rally/"
license=('GPL2')
source=(http://sourceforge.net/projects/trigger-rally/files/trigger-$pkgver/trigger-rally-$pkgver-data.tar.bz2)
sha512sums=('93eeff5b68e1b2ac5b95b2eef97a5d9cad17a2323f4073360855d2e87bcf759ed35e3ae0309798fa16e46a333123195435c58a4c273d52a8f3801857bfdf6fd4')

package() {

  mkdir -p $pkgdir/opt/games/trigger/trigger-$pkgver-data

  mv trigger-rally-$pkgver-data/* $pkgdir/opt/games/trigger/trigger-$pkgver-data

  chmod -R 755 $pkgdir/opt/games/trigger/trigger-$pkgver-data

}

# vim:set ts=2 sw=2 et:
