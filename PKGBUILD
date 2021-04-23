# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-exec-plugin
pkgver=0.3.0
pkgrel=1
pkgdesc="Run commands when the timer starts, stops or finishes"
arch=('any')
url="https://github.com/eliostvs/tomate-exec-plugin"
license=('GPL')
depends=('python'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('ce8e478d4cea94bd79e075874e2d2990')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
