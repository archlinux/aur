# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.1.5/ai_pkg-0.1.5-py3-none-any.whl")
sha256sums=('c1ef97730734614b541c82d23c739fe3cd6d5b38914aea89e73e7a7bbceef7ab')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.5-py3-none-any.whl
}
