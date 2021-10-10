# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch
pkgver=1.7
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/$pkgname"
license=('GPL3')
makedepends=("gcc")
optdepends=("viu: Display distro logos as images"
		"lshw: Better GPU detection")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheDarkBug/uwufetch/archive/$pkgver.tar.gz")
sha256sums=("ed737f29442db0b82def11ba2902f136c8205750493d4b5222639be071c5a3c3")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
