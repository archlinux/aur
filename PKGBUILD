# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.1.6/ai_pkg-0.1.6-py3-none-any.whl")
sha256sums=('58ceff97795477fe6e00aa32c6b2065df25fce0ceb8bced1cd7c29213e3c32a0')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.6-py3-none-any.whl
}
