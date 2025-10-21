pkgname=canpass
pkgver=1.1
pkgrel=1
pkgdesc="Cool console password manager for your linux system!"
arch=('x86_64')
url="https://thendsoft.su/canpass.html"
license=('GPL')
depends=('gcc-libs' 'openssl')
source=("canpass.cpp")
md5sums=('SKIP')

build() {
    g++ -std=c++17 -Wall -Wextra -O2 -o canpass canpass.cpp -lcrypto
}

package() {
    install -Dm755 canpass "$pkgdir/usr/bin/canpass"
}
