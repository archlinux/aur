# Maintainer: Your Name <you@example.com>
pkgname=ai-pkg-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-textual' 'python-httpx' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.2.0/ai_pkg-0.2.0-py3-none-any.whl")
sha256sums=('64e55d46a2ae626b29ba2d4a1ae04274f0e2f5fe5ea149dbfd91c7b5a0f1b853')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" ai_pkg-0.2.0-py3-none-any.whl
}
