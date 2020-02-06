# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=persim
pkgname=python-$_modulename
pkgver=0.1.1
pkgrel=1
pkgdesc="Distances and representations of persistence diagrams"
arch=(any)
url="https://github.com/scikit-tda/persim"
license=('MIT')
groups=()
depends=('python-scikit-learn' 'python-numpy' 'python-matplotlib' 'python-scipy' 'python-hopcroftkarp-git')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b845d42f07d256d7004c12a767d55b540b0fc28c0ff719d2a4ccaa6d79b7d155')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
