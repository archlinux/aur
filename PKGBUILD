# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: flu

pkgname=mopidy-tunein
_pypiname=Mopidy-TuneIn
pkgver=0.2.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from TuneIn"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.18'
	'python2-setuptools'
	'python2-requests'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('3119977c7196f50519f13600ae775e96')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
