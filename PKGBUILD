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
sha256sums=('57159a39e67a36df13f28f87cda2246fd5c4b894e5afc91d2317aefec0d9a9f9')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.7-py3-none-any.whl
}
