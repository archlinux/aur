# Maintainer: Hanashiko hlichisper@gmail.com
pkgname=jwtk
pkgver=0.1.0
pkgrel=1
# pkgdesc="A comprehensive CLI JWT toolkit that provides decoding, validation, and generation capabilities. JWTK serves as a local alternative to jwt.io with additional features for developers working with JWT tokens."
pkgdesc="A comprehensive CLI JWT toolkit that provides decoding capabilities. JWTK serves as a local alternative to jwt.io with additional features for developers working with JWT tokens."
arch=('x86_64')
url="https://github.com/Hanashiko/jwtk"
license=('MIT')
depends=()
makedepends=('go')
source=('main.go' 'go.mod' 'go.sum')
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    cd "$srcdir"
    go build -o jwtk main.go
}

package() {
    install -Dm755 "$srcdir/jwtk" "$pkgdir/usr/bin/jwtk"
}
