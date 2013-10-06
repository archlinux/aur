# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
pkgname=unknown-horizons
pkgver=2013.3
pkgrel=3
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('i686' 'x86_64')
url="http://www.unknown-horizons.org/"
license=('GPL' 'CCPL')
depends=('fife' 'python2' 'python2-pillow' 'python2-yaml')
conflicts=('unknown-horizons-svn' 'unknown-horizons-git')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('1d7f1c89afdb6c2a559a6e42ebb13def')
sha256sums=('75e2484eec56cbd789f57ed095300e096b1fe73816d862eadc08c08740639a1d')

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py --quiet install --root="$pkgdir" --optimize=1
}
