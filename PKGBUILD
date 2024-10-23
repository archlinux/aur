pkgname="term-owo-git"
pkgver=1.3
pkgrel=1
pkgdesc="A simple C++ program that owofies text"
url="https://git.alfieking.dev/acetheking987/term-owo-cpp"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
makedepends=(cmake git gcc)
license=('MIT')

source=("git+https://git.alfieking.dev/acetheking987/term-owo-cpp.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/term-owo-cpp"
    make dirs build_unix
}

package() {
    cd "$srcdir/term-owo-cpp/build"
    install -Dm755 owo "$pkgdir/usr/bin/owo"
}           
