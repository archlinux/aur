# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=pywwt
pkgname=python-$_modulename
pkgver=0.8.0
pkgrel=1
pkgdesc="Python interface to the Windows and Web client of WorldWide Telescope"
arch=(any)
url="https://github.com/WorldWideTelescope/pywwt"
license=('BSD')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-ipywidgets' 'python-traitlets' 'python-qtpy' 'python-flask' 'python-six')
makedepends=('python-setuptools' 'npm')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e21c191245a98c3fbb064bb3927023af3c22b83055e5c518aaaa115de9f882de')
#check() {
#  cd "$srcdir/CAMB-$pkgver/"
#  python setup.py test
#}
package() {
  cd "$srcdir/pywwt-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
