pkgname=mopidy-alarmclock
pkgver=0.1.7
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
source=("https://github.com/DavisNT/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('041a9512324caefef1cc03c5cf838fd4aa241049f45a173fcd07558f0b368e78')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
