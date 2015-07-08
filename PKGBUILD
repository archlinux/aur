# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Roman G <drakosha@au.ru>

pkgname=torrentinfo
pkgver=1.0.2
pkgrel=3
pkgdesc="Bittorrent .torrent file parser and summariser"
arch=('any')
url="http://vrai.net/project.php?project=torrentinfo"
license=('GPL2')
depends=('python2')
source=(http://vrai.net/files/software_projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0ab4400f43a9509cb858d07917603cda')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
