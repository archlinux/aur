pkgname=seija
pkgver=1.0
pkgrel=1
pkgdesc="A tiny CLI utility that flips and reverses text, written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/seija"
license=('GPL')
depends=('ruby')
source=("seija")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/seija" "$pkgdir/usr/bin/seija"
}
