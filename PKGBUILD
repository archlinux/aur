# Maintainer: Florent Thiéry <fthiery@gmail.com>
pkgname="gst-gtklaunch-1.0"
pkgver=2015.12.27
pkgrel=1
pkgdesc="A utility for testing and controlling live GStreamer 1.0 pipelines. It
will inspect the specified pipeline to create the GTK GUI automagically using
introspection"
arch=('any')
license=('LGPL')
url="https://github.com/UbiCastTeam/${pkgname}"
depends=('python' 'python-setuptools' 'python-gobject' 'gtk3' 'xdot' 'graphviz')
source=("git+${url}.git")
sha512sums=('SKIP')
makedepends=('git')

package() {
  cd "${srcdir}/${pkgname}"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
