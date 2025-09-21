# Maintainer: Rohan Kumar Singh <rohankrsingh125@gmail.com>
pkgname=ai-pkg-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="AI-powered package recommender and installer for Arch Linux"
arch=('x86_64')
url="https://github.com/rohankrsingh/ai-pkg"
license=('MIT')
depends=('python' 'python-typer' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ai-pkg')
conflicts=('ai-pkg')

# Workflow will update this dynamically
source=("https://github.com/rohankrsingh/ai-pkg/releases/download/v0.1.4/ai_pkg-0.1.4-py3-none-any.whl")
sha256sums=('8b413afd9ab1d9e6675583be915d8c76846560060e96485229171eeb38180dc6')

package() {
    cd "$srcdir"  
    python -m installer --destdir="$pkgdir" ai_pkg-0.1.4-py3-none-any.whl
}

