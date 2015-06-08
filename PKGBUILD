# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-scrobbler
pkgver=1.1.0
pkgrel=2
pkgdesc="Mopidy extension for scrobbling played tracks to Last.fm"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.18'
	'python2-pykka>=1.1'
	'python2-pylast>=0.5.7'
	'python2-setuptools')
makedepends=('python2')
provides=('mopidy-scrobbler')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('bc6bf306c6effeb4e12137e5eb12cf5e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
