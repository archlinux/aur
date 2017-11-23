# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=albert-mathematica-evaluate
pkgver=r23.3f69224
pkgrel=1
pkgdesc="Albert extension for easily evaluating mathematica statements"
arch=('any')
url="https://github.com/Tyilo/albert-extensions"
license=('GPL')
depends=('albert' 'mathematica')
optdepends=()
source=("git+https://github.com/Tyilo/albert-extensions")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/albert-extensions"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D "${srcdir}/albert-extensions/mathematica_eval.py" "${pkgdir}/usr/share/albert/org.albert.extension.python/modules/mathematica_eval.py"
}
