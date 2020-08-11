# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=panel
pkgname=python-$_pkgname
pkgver=0.9.7
pkgrel=1
pkgdesc="A high level app and dashboarding solution for Python."
arch=("any")
url="https://panel.holoviz.org/"
license=('BSD')
depends=('python-bokeh' 'python-param' 'python-pyviz_comms' 'python-markdown' 'python-tqdm' 'python-pyct')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/97/72/d7c08aafd4a1cb170711ab4631342152a5345cb05231b20205f53e6b4144/panel-0.9.7.tar.gz')
sha256sums=('2e86d82bdd5e7664bf49558eedad62b664d5403ec9e422e5ddfcf69e3bd77318')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
