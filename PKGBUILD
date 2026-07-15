pkgname=ezc-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='A terminal clipboard for copying and moving files'
arch=('x86_64')
url='https://github.com/mornhussakuyo-hub/ezc'
license=('MIT')
provides=("ezc=$pkgver")
conflicts=('ezc')
options=('!strip')
source_x86_64=("ezc-$pkgver.tar.gz::$url/releases/download/v$pkgver/ezc_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('7b936b8fefde4ddde3bf897ce275034835726a5806c687f54f7f85383ff5cabd')

package() {
    install -Dm755 "$srcdir/ezc" "$pkgdir/usr/bin/ezc"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/ezc/README.md"
    install -Dm644 "$srcdir/DESIGN.md" "$pkgdir/usr/share/doc/ezc/DESIGN.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/ezc/LICENSE"
}
