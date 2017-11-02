# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=python-syntrax
pkgver=1.0
pkgrel=1
pkgdesc="Railroad syntax diagram generator"
arch=(any)
url="https://kevinpt.github.io/syntrax/"
license=('MIT')
depends=('python-gobject')
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/44/95/4c154962169ad156d46ca18c3d7a641e9904ed415c057932709f58d7485d/syntrax-1.0.tar.gz')
md5sums=('2015def185efe7eca35c6cd8d17d61af')

package() {
  cd "$srcdir/syntrax-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
