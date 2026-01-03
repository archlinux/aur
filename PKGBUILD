pkgname=seija
pkgver=1.0
pkgrel=1
pkgdesc="A small script that prints out text flipped and reversed (touhou reference)"
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/seija"
license=('GPL')
depends=('ruby')
source=("seija")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/seija" "$pkgdir/usr/bin/seija"
}
