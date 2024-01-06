pkgname=acronym
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool that syncs shell usage between development environments through aliases"
arch=('x86_64')
url="https://github.com/chinarjoshi/acronym"
license=('MIT')
source=("https://github.com/chinarjoshi/acronym/releases/download/v$pkgver/acronym-$pkgver-amd64")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/acronym-$pkgver-amd64" "$pkgdir/usr/bin/acronym"
}
