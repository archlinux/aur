pkgname=mopidy-alarmclock
pkgver=0.1.6
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
sha256sums=('82c27cfe2828d9bf1969b832b142f4567c91fc9e6eb49ad89aedd92513fb75cf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
