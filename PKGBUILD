# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-gitman
pkgver=3.8.1
pkgrel=2
pkgdesc="A language-agnostic dependency manager using Git."
arch=('any')
url="https://github.com/jacebrowning/gitman"
license=('MIT')
depends=('python' 'python-datafiles' 'python-minilog' 'python-universal-startfile' 'git')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/9e/04/67940d75602b66e7d7726d7841e2d8e927060f8a8e47f81afc3da4afd991/gitman-${pkgver}-py3-none-any.whl")
noextract=("gitman-${pkgver}-py3-none-any.whl")
sha256sums=('b9c0d0e614a0769f1a907b0290c6f4b203dffb4eb2de9d17c470f4d472ebd203')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/gitman-${pkgver}-py3-none-any.whl"
}
