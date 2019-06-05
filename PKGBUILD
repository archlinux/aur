# Maintainer: Matthijs Tadema <M dot J dot Tadema at protonmail dot com>

pkgname=martinize-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Describe and apply transformation on molecular structures and topologies"
arch=('any')
url="https://github.com/marrink-lab/vermouth-martinize"
license=('Apache')
depends=('python>=3.5')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}_${pkgver}::git+https://github.com/marrink-lab/vermouth-martinize.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
        cd ${pkgname}_${pkgver}
        /usr/bin/env python3 setup.py install --prefix="$pkgdir/usr/"
}
