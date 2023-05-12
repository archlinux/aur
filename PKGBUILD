# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=mpd-muspy
pkgver=1.0.2
pkgrel=2
pkgdesc="Sync artists of your MPD database with your MuSpy account."
arch=(any)
url="https://github.com/Anthony25/mpd-muspy"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=(
  python-appdirs
  python-mpd2
  python-musicbrainzngs
  python-requests
  python-urllib3
)
options=(!emptydirs)
source=("https://github.com/Anthony25/mpd-muspy/archive/v${pkgver}.tar.gz")
sha256sums=('e6b004424dd37cb467caa32ba921091da509e057d7451dcf6810a92858715b44')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
