# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>

pkgname=lastfreemind
pkgver=0.0.2
pkgrel=1
pkgdesc='Command line tool to keep the last version of mindmaps from a collection of freemind mindmaps'
arch=('any')
url='https://gitlab.com/plenae/lastfreemind'
license=('GPL3')
depends=('python-lxml')
source=("https://gitlab.com/plenae/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha512sums=('ec4047a32bde86b7fc3cea380f81aac21851a2909c7a3de95551a01db3c501dc28ef1d2b13bb5a3d4b401037c4c2460508cf81287decae5a98f7bddf6bda6000')

package() {
  cd $pkgname-v$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
