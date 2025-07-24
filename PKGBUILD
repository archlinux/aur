pkgname=chattr2
pkgver=3.4
pkgrel=3
pkgdesc="A simple package that allows you to send messages to computers or modify files on computers remotely."
arch=('x86_64')
license=('MIT')
depends=('openssl' 'bash' 'coreutils' 'socat')
source=("https://github.com/shadowfreddy25551/chattr/archive/refs/heads/main.zip")
sha256sums=('SKIP')

package() {
    echo "THIS PACKAGE WILL LIKELY BE BUGGED SINCE WE ARE CURRENTLY FIXING THE VERSIONS. IF IT DOES NOT WORK PLEASE WAIT TILL THIS MESSAGE IS REMOVED TO GUARANTEE FUNCTIONALITY."
    sleep 5
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "chattr-main/code.sh" "$pkgdir/usr/bin/chattr2"
}

build() {
    :
}

check() {
    :
}
