# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Roman G <drakosha@au.ru>

pkgname=torrentinfo
pkgver=1.8.6
pkgrel=1
pkgdesc="Bittorrent .torrent file parser and summariser"
arch=('any')
url="https://github.com/Fuuzetsu/torrentinfo"
license=('GPL2')
depends=('python2')
source=("https://github.com/Fuuzetsu/torrentinfo/archive/v${pkgver}.tar.gz")
sha1sums=('b3e17039b081e383dda92dae5c614698cba2398d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
