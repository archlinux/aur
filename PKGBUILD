# Maintainer: Simon Williams <simon@clockcycles.net>
pkgname=pywdgen
pkgver=1.0
pkgrel=4
epoch=
pkgdesc="A simple readable password generator, written in Python"
arch=(any)
url="https://github.com/simonpw/pywdgen"
license=('GPL')
groups=()
depends=('python>=3.0')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/simonpw/pywdgen.git")
noextract=()
md5sums=('SKIP')

package() {
        cd "$srcdir/$pkgname"
        install -Dm755 pywdgen.py ${pkgdir}/usr/bin/pywdgen
        install -Dm644 COPYING ${pkgdir}/usr/share/licenses/pywdgen/COPYING
}
