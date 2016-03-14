# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=python-turbogears
pkgver=2.3.8
pkgrel=1
pkgdesc="A hybrid web framework able to act both as a Full Stack framework or as a Microframework"
arch=('any')
url="http://www.turbogears.org/"
license=('MIT')
depends=('python' 'python-webob' 'python-crank' 'python-beaker' 'python-repoze.lru')
source=("git://github.com/TurboGears/tg2.git#tag=tg$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/tg2"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
