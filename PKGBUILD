# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-props
pkgver=1.2.3
pkgrel=1
pkgdesc="The fsleyes-props project is an event programming framework, which includes the ability for automatic CLI generation and, optionally, automatic GUI generation (if wxPython is present). It is used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'wxpython-phoenix' 'fslpy' 'fsleyes-widgets')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/props/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('104b0ad90053ebc30f538edbbaaed9204359c30989786243266d9acd3530e800')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}
