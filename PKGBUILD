# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.9.8
pkgrel=1
pkgdesc='A handy way to save and run project-specific commands'
arch=('x86_64')
url='https://github.com/casey/just'
license=('custom:CC0')
provides=('just')
conflicts=('just')
changelog="$pkgname.changelog"
source=("https://github.com/casey/just/releases/download/${pkgver}/just-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('1c5a2e55d91c532e733a16ae2a097eb7c66971adcae6b6e7be984a72140afd2644a2870dde85bb7523ca749e418fa35f7fdfd4c72af979859b130275b3a51ed9')

package() {
  cd "$srcdir"

  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"
  install -Dm644 just.1 "$pkgdir/usr/share/man/man1/just.1"
}
