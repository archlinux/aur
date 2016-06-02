# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: kozec <kozec at kozec dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=fusion-icon0.9
pkgver=0.2+gitb3ec91c
pkgrel=1
pkgdesc="Simple tray icon for Compiz 0.9 and GTK3"
arch=('any')
url="https://github.com/kozec/fusion-icon-gtk3"
license=('GPL')
provides=('fusion-icon=0.2')
conflicts=('fusion-icon')
depends=('python2' 'compiz>=0.9' 'python2-gobject' 'gtk3' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')
source=("https://github.com/kozec/fusion-icon-gtk3/archive/b3ec91cb2b6a73803bb734612efd2bf6ca503b16.tar.gz")
sha256sums=('eb47d5fdce12528634f6bd5ab11ccd8bad1736f93a315a433d7c6ac0e93ebd23')

package() {
  cd $srcdir/fusion-icon-gtk3-*
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
