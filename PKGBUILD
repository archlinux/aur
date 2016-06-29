# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: kozec <kozec at kozec dot com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=fusion-icon0.9
_realname=fusion-icon-gtk3
_commit=ceff5be7ac43b3083e0f30653ba44401357f6c54
pkgver=0.2+git${_commit:0:7}
pkgrel=1
pkgdesc="Simple tray icon for Compiz 0.9 and GTK3"
arch=('any')
url="https://github.com/kozec/fusion-icon-gtk3"
license=('GPL')
provides=('fusion-icon=0.2')
conflicts=('fusion-icon')
depends=('python2' 'compiz>=0.9' 'python2-gobject' 'gtk3' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')
source=("https://github.com/kozec/${_realname}/archive/${_commit}.tar.gz")
sha256sums=('cc18320aec9b82b497200a64f28f6dcd17ac86308ebd0e202b6a55e114b9ab7a')

package() {
  cd $srcdir/${_realname}-${_commit}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
