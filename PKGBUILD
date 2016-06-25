pkgdesc="App Container Image Build and Runtime Tool"
pkgname=dgr
pkgver=70
pkgrel=1
url="https://github.com/blablacar/$pkgname"
source=("$url/releases/download/$pkgver/$pkgname-linux-amd64-$pkgver.tar.gz")
md5sums=('SKIP')
options=('!strip')
arch=('x86_64')
license=('Apache')

# 1.
prepare() {
    true
}

# 2.
build() {
    true
}

# 3.
check() {
    true
}

# 4.
package() {
    install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
