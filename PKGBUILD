# Maintainer: Logan Marchione <logan (at) loganmarchione (dot) com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=variety-git
_gitname=variety
pkgver=0.6.9
pkgrel=1
pkgdesc="Variety wallpaper changer (git version)"
arch=('any')
url="https://github.com/varietywalls/variety"
license=('GPL3')
depends=('python2' 'gtk3' 'imagemagick' 'libgexiv2' 'libnotify' 'python2-beautifulsoup4' 'python2-cairo'
         'python2-configobj' 'python2-dbus' 'python2-gobject' 'python2-httplib2' 'python2-pillow'
         'python2-lxml' 'python2-pycurl' 'python2-requests')
makedepends=('git' 'python2-distutils-extra')
optdepends=('xdg-user-dirs: set wallpaper for KDE Plasma')
provides=('variety')
conflicts=('variety')
source=(git+https://github.com/varietywalls/variety)
md5sums=(SKIP)

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
