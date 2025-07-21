pkgname=chattr2
pkgver=2.3
pkgrel=2
pkgdesc="A simple package that allows you to send messages to computers or modify files on computers remotely."
arch=('x86_64')
license=('MIT')
depends=('openssl' 'bash' 'coreutils')
source=("https://github.com/shadowfreddy25551/chattr/archive/refs/heads/main.zip")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "chattr-main/code.sh" "$pkgdir/usr/bin/chattr2"
}

build() {
    :
}

check() {
    :
}
