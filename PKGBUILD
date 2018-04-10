# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-widgets
pkgver=0.5.4
pkgrel=2
pkgdesc="FSLeyes is the FSL image viewer, widgets is one of its dependent projects"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-wxpython>=4.0.1-2' 'python-deprecation')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/widgets/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('354f2cf699f8915c440008df81008d24e8fea60a344854e6adaad91bd6ce6dc3')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}
