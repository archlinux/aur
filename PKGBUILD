pkgdesc='dgr - container build and runtime tool'
pkgname=dgr
pkgver=69
pkgrel=1
url="https://github.com/blablacar/$pkgname"
source=("$url/releases/download/$pkgver/$pkgname-linux-amd64-$pkgver.tar.gz")
arch=('x86_64')
md5sums=('SKIP')
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
    install -D -m755 dgr "$pkgdir/usr/bin/dgr"
}
