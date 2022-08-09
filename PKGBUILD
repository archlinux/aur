# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-exec-plugin
pkgver=0.8.2
pkgrel=1
pkgdesc="Tomate plugin that run bash commands when the session starts, stops or finishes"
arch=('any')
url="https://github.com/eliostvs/tomate-exec-plugin"
license=('GPL')
depends=('python'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('46362f7bfc346af092b66c6318f1ffcf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
