# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=rambler
pkgver=5.2.0
pkgrel=1
pkgdesc="A simple and language-independent SQL schema migration tool"
arch=(i686 x86_64 armv7h)
url="https://github.com/elwinar/rambler"
license=("Unlicense")
makedepends=(go)
sha256sums=(6cf9c4c1a4569f92e0add1273a9bb4337e85683797000417683d98faf8f93ca3)
source=("https://github.com/elwinar/rambler/archive/v$pkgver.tar.gz")

build() {
    cd rambler-$pkgver
    make
}

package() {
    install -Dm755 rambler-$pkgver/rambler $pkgdir/usr/bin/rambler
}
