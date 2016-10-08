# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: flu

pkgname=mopidy-tunein
pkgver=0.4.1
pkgrel=1
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
source=("https://github.com/kingosticks/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('388f90860d55b4a4f55120142e2c128c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
