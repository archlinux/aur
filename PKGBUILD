# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname='python-reorder-python-imports-isort-wrapper'
pkgver=0.1.0
pkgrel=1
pkgdesc='Wrapper for `reorder-python-imports` to emulate isort --diff for \
vscode python plugin and coc-pyright'
depends=('bash' 'python-reorder-python-imports')
license=('MIT')
arch=('any')
source=('isort-rpi')
sha256sums=('7be3f2734f989607894d03697a79e7f212313ae70fd18b06d3abe77a4e1f8b6c')

package() {
	cd "$srcdir"
    install -Dm755 isort-rpi -t "$pkgdir"/usr/bin/
}
