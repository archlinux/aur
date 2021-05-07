# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-breakscreen-plugin
pkgver=0.2.0
pkgrel=1
pkgdesc="Tomate plugin that shows a full screen window which prevents users from using the computer during a break"
arch=('any')
url="https://github.com/eliostvs/tomate-breakscreen-plugin"
license=('GPL')
depends=('python'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('067df380422e8aa2c284c7a37bb2f3d6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
