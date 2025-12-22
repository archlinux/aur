pkgname=mangcli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Native-first universal package manager"
arch=("x86_64")
url="https://github.com/YOURNAME/mangCLI"
license=("MIT")
depends=()
provides=("mangcli")
conflicts=("mangcli")

source=(
  "mang::https://github.com/edwrdq/mangCLI/releases/download/v0.1.0/mang-v0.1.0-linux-x86_64"
)

sha256sums=("SKIP")

package() {
  install -Dm755 "$srcdir/mang" "$pkgdir/usr/bin/mang"
}
