# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>
# Pull requests are welcome: https://github.com/pSub/pkgbuilds
# Thanks to awayand for the update
pkgname=lorem-ipsum-generator
pkgver=0.3
pkgrel=2
pkgdesc="Generates random lorem ipsum text"
arch=(any)
url="http://code.google.com/p/lorem-ipsum-generator/"
license=('New BSD License')
groups=
provides=()
depends=()
makedepends=('python2-distribute' 'python2' 'pygtk' 'gtk')
conflicts=()
replaces=()
backup=()
install=
options=(!emptydirs)
source="http://lorem-ipsum-generator.googlecode.com/files/$pkgname-$pkgver.tar.gz"
md5sums=('318b3c890ffa575c6467d033785b2f0f')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
