# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=albert-tex-to-unicode
pkgver=r23.3f69224
pkgrel=1
pkgdesc="Albert extension for converting tex math to unicode symbols"
arch=('any')
url="https://github.com/Tyilo/albert-extensions"
license=('GPL')
depends=('albert' 'python' 'python-pylatexenc')
optdepends=()
source=("git+https://github.com/Tyilo/albert-extensions")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/albert-extensions"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D "${srcdir}/albert-extensions/tex_to_unicode.py" "${pkgdir}/usr/share/albert/org.albert.extension.python/modules/tex_to_unicode.py"
}
