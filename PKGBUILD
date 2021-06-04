# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.9.4
pkgrel=1
pkgdesc='A handy way to save and run project-specific commands'
arch=('x86_64')
url='https://github.com/casey/just'
license=('custom:CC0')
provides=('just')
conflicts=('just')
changelog="$pkgname.changelog"
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('6a54152cd65b740aa9a5c14696b6a54b64625f7ccf5eb9cb58a24faf7e7ec9c7f133c737cc04c91df28b9a51b3621b1cc27032592e86a492dd896d2b524cfea8')

package() {
  cd "$srcdir"

  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"
  install -Dm644 just.1 "$pkgdir/usr/share/man/man1/just.1"
}
