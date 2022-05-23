# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-xnatpy
_name=xnat
pkgver=0.4.2
pkgrel=1
pkgdesc="A new XNAT client that exposes XNAT objects/functions as python objects/functions."
arch=('any')
url="https://bitbucket.org/bigr_erasmusmc/xnatpy"
license=('Apache')
groups=()
depends=('python' 'python-isodate' 'python-progressbar' 'python-six' 'python-sphinx_rtd_theme' 'python-requests' 'python-click')
makedepends=()
provides=()
conflicts=()
replaces=('xnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('519e12b5f27765eb2471b08b848a148f632f990a9cc8afee8d7ed9cb75b061f4')

package() {
  cd "$srcdir"/$_name-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
