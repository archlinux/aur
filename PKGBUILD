# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-multinest
pkgver='3.12'
pkgrel=1
pkgdesc="MultiNest is a Bayesian inference tool which calculates the evidence and explores the parameter space which may contain multiple posterior modes and pronounced (curving) degeneracies in moderately high dimensions."
arch=(any)
url="https://github.com/JohannesBuchner/PyMultiNest"
groups=()
depends=('multinest')
license=('custom')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
    "${url}/archive/b147515e950cf225befef3f0e26408c672f01979.tar.gz"
)
sha256sums=(
    'cebd358d24044863560d80e43436414a9341c25a25d572db1851a507ecf59bfc'
)
package() {
    cd "${srcdir}/PyMultiNest-b147515e950cf225befef3f0e26408c672f01979/"
    python setup.py install --root="$pkgdir/" --optimize=1
}

