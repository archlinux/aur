pkgname=r2d2
pkgver=1.0.0
pkgrel=1
pkgdesc="The R2D2 programming language CLI written in Go"
arch=('x86_64')
url="https://github.com/ArturC03/r2d2-cli"
license=('MIT')
depends=('deno')
makedepends=('go' 'git')
source=("git+$url.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/r2d2-cli"
  go build -o r2d2 .
}

package() {
  cd "$srcdir/r2d2-cli"
  install -Dm755 r2d2 "$pkgdir/usr/bin/r2d2"
}

