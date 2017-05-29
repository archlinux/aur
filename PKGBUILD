# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=mpd-muspy
pkgver=1.0.1
pkgrel=1
pkgdesc="Sync artists of your MPD database with your MuSpy account."
arch=(any)
url="https://github.com/Anthony25/mpd-muspy"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=(
  python-appdirs
  python-argparse
  python-mpd2
  python-musicbrainzngs
  python-requests
  python-urllib3
)
options=(!emptydirs)
source=("https://github.com/Anthony25/mpd-muspy/archive/v${pkgver}.tar.gz")
sha256sums=('e3e5a75c13680ed7911a0b0e9c584aca51b7d99483a66c2421eae674756f6756')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
