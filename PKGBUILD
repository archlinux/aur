# Maintainer: Hanashiko hlichisper@gmail.com
pkgname=portchaos
pkgver=0.1.0
pkgrel=1
pkgdesc="Random fake TCP services on random ports for firewall testing, honeypots, and pentesting"
arch=('x86_64')
url="https://github.com/Hanashiko/portchaos"
license=('MIT')
depends=()
makedepends=('go')
source=("main.go")
sha256sums=('3cfdfe0f1bb92bcce056854a6fd8ef8b545381657285c0eecc9f09206f42d760')

build() {
    cd "$srcdir"
    go build -o portchaos main.go
}

package() {
    install -Dm755 "$srcdir/portchaos" "$pkgdir/usr/bin/portchaos"
}
