# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-mynt
pkgver=0.3
pkgrel=2
pkgdesc="A static site generator designed to give you all the features of a CMS."
arch=('any')
url="http://mynt.mirroredwhite.com/"
license=('BSD')
depends=('python2>=2.7' 'python2-hoep' 'python2-jinja>=2.7.2'
         'python2-pygments' 'python2-watchdog' 'python2-yaml')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/mynt/mynt-${pkgver}.tar.gz")
sha256sums=('77a9ae4c8bd6f3687da2f9f16cf44117d6b1338ee1b973392247bd833fe93852')

package() {
  cd "$srcdir/mynt-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
