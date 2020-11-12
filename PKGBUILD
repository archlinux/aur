# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor: Baptiste Jonglez <zerstorer at free dot fr>

pkgbase=python-gnuplot
pkgname=(python-gnuplot)
pkgver=1.8
pkgrel=11
pkgdesc='Plot graphs with Gnuplot'
arch=(any)
license=(LGPL)
url='https://gnuplot-py.sourceforge.net/'
depends=(python-numpy gnuplot)
makedepends=(git python-setuptools)
source=("git+https://github.com/yuyichao/gnuplot-py#commit=2c2218dc67")
sha256sums=('SKIP')

package() {
  cd gnuplot-py

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: ts=2 sw=2 et:
