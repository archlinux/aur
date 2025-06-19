pkgname=bellybutton
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI grammar checker for Bash, JS, Python, Go, and Rust"
arch=('any')
url="https://github.com/SW-philip/bellybutton"
license=('MIT')
depends=('bash' 'shellcheck' 'eslint' 'ruff' 'golangci-lint' 'cargo')
optdepends=(
  'shellcheck: for Bash linting'
  'eslint: for JavaScript linting'
  'ruff: for Python linting'
  'golangci-lint: for Go linting'
  'cargo: for Rust support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SW-philip/bellybutton/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('186095e411e8e72a32bc277086054223fedb82d45e3f6e50eb5040fa83a3358d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bellybutton.sh "$pkgdir/usr/bin/bellybutton"
}
