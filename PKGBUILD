# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: kozec <kozec at kozec dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=fusion-icon0.9
pkgver=0.2
pkgrel=3
pkgdesc="Simple tray icon for Compiz 0.9 and GTK3"
arch=('any')
url="https://github.com/kozec/fusion-icon-gtk3"
license=('GPL')
provides=('fusion-icon=0.2')
conflicts=('fusion-icon')
depends=('python2' 'compiz>=0.9' 'python2-gobject' 'gtk3' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')
source=("https://github.com/kozec/fusion-icon-gtk3/archive/v${pkgver}.tar.gz")
sha256sums=('709065e18d0bfa992c9c6124a64cd24e7ec2113d867c0eb4d44adfae2b7c40b8')

package() {
  cd $srcdir/fusion-icon-gtk3-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
