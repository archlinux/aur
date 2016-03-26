# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: flu

pkgname=mopidy-tunein
_pypiname=Mopidy-TuneIn
pkgver=0.3.0
pkgrel=2
pkgdesc="Mopidy extension for playing music from TuneIn"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=1.1'
	'python2-setuptools'
	'python2-requests'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('42a69c25c3d59afff4d75a8a75ec9f44')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
