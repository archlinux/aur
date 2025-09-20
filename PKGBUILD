# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("${url}/releases/tag/v${pkgver}/ai-pkg-${pkgver}.whl")
sha256sums=('REPLACE_ME')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-${pkgver}.whl
}
