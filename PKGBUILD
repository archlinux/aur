# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=persim
pkgname=python-$_modulename
pkgver=0.1.2
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
sha256sums=('bc8e0e513f9193f541556191e8220ad01ec2bdd02ca6f42d267a7d2bea847b6b')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
