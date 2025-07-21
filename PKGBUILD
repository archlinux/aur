pkgname=chattr
pkgver=1.3
pkgrel=1
pkgdesc="Simple secure chat between two PCs using TLS and bash"
arch=('x86_64')
license=('MIT')
depends=('openssl' 'bash' 'coreutils')
source=("https://github.com/shadowfreddy25551/chattr/archive/refs/heads/main.zip")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "chattr-main/code.sh" "$pkgdir/usr/bin/chattr"
}

build() {
    :
}

check() {
    :
}
