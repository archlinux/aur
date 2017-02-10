# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
pkgname=unknown-horizons
pkgver=2017.2
pkgrel=1
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('i686' 'x86_64')
url="http://www.unknown-horizons.org/"
license=('GPL' 'CCPL')
depends=('fife>=0.4.1' 'python2' 'python2-pillow' 'python2-yaml')
makedepends=('intltool')
conflicts=('unknown-horizons-svn' 'unknown-horizons-git')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('a99c8858f6cce0b560b97ce74518d007')
sha256sums=('4d2d3d1d82b9c5bbe4d49a3ee82eff70b8fec6429eb295e86cd6a381345ad7bb')

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py --quiet install --root="$pkgdir" --optimize=1
}

