# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=panel
pkgname=python-$_pkgname
pkgver=0.9.5
pkgrel=1
pkgdesc="A high level app and dashboarding solution for Python."
arch=("any")
url="https://panel.holoviz.org/"
license=('BSD')
depends=('python-bokeh' 'python-param' 'python-pyviz_comms' 'python-markdown' 'python-tqdm' 'python-pyct')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/13/26/fe10647c0bd6938c015ff2a65fe4fa2cda600c85995fe68cc56f65c4666c/panel-0.9.5.tar.gz')
sha256sums=('53340615f30f67f3182793695ebe52bf25e7bbb0751aba6f29763244350d0f42')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
