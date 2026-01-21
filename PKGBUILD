pkgname=terminal-fireworks
pkgver=0.1.0
pkgrel=1
pkgdesc="Fireworks for the terminal"
arch=('any')
url="https://github.com/chloem3ow/terminal-fireworks"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+https://github.com/chloem3ow/terminal-fireworks.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # Install using pip to a specific prefix
  python -m pip install --no-deps --root="$pkgdir" --prefix=/usr .
}
