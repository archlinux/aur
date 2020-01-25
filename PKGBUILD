# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: flu

pkgname=mopidy-tunein
pkgver=1.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from TuneIn"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=3.0'
	'python-setuptools'
	'python-requests'
	'python-pykka'
)
makedepends=('python' 'git')
source=("https://github.com/kingosticks/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e1533b57a2e7701dd05e5c595c04a26c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
