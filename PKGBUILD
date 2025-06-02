# Maintainer: Hanashiko hlichisper@gmail.com
pkgname=jwtk
pkgver=0.1.0
pkgrel=2
# pkgdesc="A comprehensive CLI JWT toolkit that provides decoding, validation, and generation capabilities. JWTK serves as a local alternative to jwt.io with additional features for developers working with JWT tokens."
pkgdesc="A comprehensive CLI JWT toolkit that provides decoding capabilities. JWTK serves as a local alternative to jwt.io with additional features for developers working with JWT tokens."
arch=('x86_64')
url="https://github.com/Hanashiko/jwtk"
license=('MIT')
depends=()
makedepends=('go')
source=('main.go' 'go.mod' 'go.sum')
sha256sums=('284d1ff502bf527522c78cdf7ebe2cf3eb1991355cc81449dc74d96ea99ddcf7' '0c3a8cdc4eec061dd960248c8bd960d7611a308ee0fd0cdf24eb74b2a2eef89b' '5a21a9a2128cdf32dd0d2d3b45391edbd78db948f3b37970b0d6a7252be84c93')

build() {
    cd "$srcdir"
    go build -o jwtk main.go
}

package() {
    install -Dm755 "$srcdir/jwtk" "$pkgdir/usr/bin/jwtk"
}
