# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.1.7/ai_pkg-0.1.7-py3-none-any.whl")
sha256sums=('c273c07909e50733f42cb3c924e752e694ed4251f9cc917d07db9e8c07a47c3c')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.7-py3-none-any.whl
}
