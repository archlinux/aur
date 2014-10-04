# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-mynt
pkgver=0.3.1
pkgrel=1
pkgdesc="A static site generator designed to give you all the features of a CMS."
arch=('any')
url="http://mynt.uhnomoli.com/"
license=('BSD')
depends=('python2>=2.7' 'python2-hoep' 'python2-jinja>=2.7.2'
         'python2-pygments' 'python2-watchdog' 'python2-yaml')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/mynt/mynt-${pkgver}.tar.gz")
sha256sums=('89700c6f3b2128f06c662e3fb8b77a89ba09582cf97ceb52c4169493f48896b4')

package() {
  cd "$srcdir/mynt-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
