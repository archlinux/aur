# Maintainer: bjo@nord-west.org

pkgname=mopidy-alarmclock
_pypiname=Mopidy-AlarmClock
pkgver=0.1.5
pkgrel=1
pkgdesc="Mopidy extension using it as an alarm clock."
arch=('any')
url="https://github.com/DavisNT/mopidy-alarmclock"
license=('APACHE')
depends=(
	'python2-setuptools'
	'mopidy>=0.19'
	'python2-pykka>=1.1'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('93d9297f223e2823d1a28442144b2d60d048a6c01ffb4d6e6e9ee6f0c49ab3b8')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
