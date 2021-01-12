# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.8.3
pkgrel=2
pkgdesc='A handy way to save and run project-specific commands'
arch=('x86_64')
url='https://github.com/casey/just'
license=('custom:CC0')
provides=('just')
conflicts=('just')
changelog="$pkgname.changelog"
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('5cc922338ebe6ab9cbee85c4e9d94d4c459b1896e05293afbc49d2f9a45c47abbd369918e21a6fddc9c0e9bbb3a1bb832a5971b19367398e5bc71b1bc1d16682')

package() {
  cd "$srcdir"

  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"
  install -Dm644 just.1 "$pkgdir/usr/share/man/man1/just.1"
}
