# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=pywwt
pkgname=python-$_modulename
pkgver=0.9.0
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
sha256sums=('e4efa7fbd5d729b94fb1e6124a55dc37071dca15959f210350133cb315c0ffdb')
#check() {
#  cd "$srcdir/CAMB-$pkgver/"
#  python setup.py test
#}
package() {
  cd "$srcdir/pywwt-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
