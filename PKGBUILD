pkgname=bellybutton
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI grammar checker for Bash, JS, Python, Go, and Rust"
arch=('any')
url="https://github.com/SW-philip/bellybutton"
license=('MIT')
depends=('bash' 'shellcheck' 'eslint' 'ruff' 'golangci-lint' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SW-philip/bellybutton/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('383168669229bff9c9fbc8605d154b578a60b0f67e41efa98dee8cc3d60559eb')

package() {
  install -Dm755 "$pkgname-$pkgver/bellybutton.sh" "$pkgdir/usr/bin/grammar"
}
