# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Martti Kühne <mysatyre@gmail.com>
# Contributor: rabyte <rabyte__gmail>
# Contributor: SanskritFritz (gmail)

pkgname=balazarbrothers
pkgver=1.0rc1
pkgrel=8
pkgdesc="A 3D puzzle and platform game"
arch=('any')
url="http://home.gna.org/oomadness/en/balazar_brothers/"
license=('GPL2')
changelog=Changelog
depends=('python2-pillow' 'openal' 'pyvorbis' 'twisted' \
         'freetype2' 'python2-soya' 'python2-cerealizer')
source=(http://download.gna.org/balazar/BalazarBrothers-$pkgver.tar.bz2)
md5sums=('b292ea006a74668dcbe4c609936b8217')

build() {
  cd "$srcdir/BalazarBrothers-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/BalazarBrothers-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
