# Maintainer: Sapphira Armageddos <shadowkyogre.public+aur <AT> gmail <DOT> com>

pkgname=python-markdown-sections
pkgver=5.7adb866
pkgrel=1
pkgdesc="Python-Markdown extension to provide a small amount of structure to Markdown documents."
arch=('any')
url="http://github.com/jessedhillon/mdx_sections"
license=('GPL2')
depends=('python-markdown')
makedepends=('git')
source=("$pkgname"::'git://github.com/jessedhillon/mdx_sections')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
