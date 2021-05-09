# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.9.2
pkgrel=1
pkgdesc='A handy way to save and run project-specific commands'
arch=('x86_64')
url='https://github.com/casey/just'
license=('custom:CC0')
provides=('just')
conflicts=('just')
changelog="$pkgname.changelog"
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('514086c78492843e5dcd216b0886f056b83f5d7b6c5d6a16d12bce153c4fea70400dbd69eaf7b1fea7b69eed77e6784496e53ec0444816847e2535cc1a84c450')

package() {
  cd "$srcdir"

  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"
  install -Dm644 just.1 "$pkgdir/usr/share/man/man1/just.1"
}
