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

source=("${url}/releases/download/v${pkgver}/ai-pkg-${pkgver}-py3-none-any.whl")
sha256sums=('REPLACE_ME')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai-pkg-${pkgver}-py3-none-any.whl
}