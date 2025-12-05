# Maintainer: Felipe Facundes
pkgname=cmd
pkgver=1.0
pkgrel=1
pkgdesc="Fuzzy finder for PATH binaries without external dependencies ( fzf / etc ) - real-time substring search"
arch=('any')
url="https://github.com/felipefacundes/cmd-fuzzy-finder"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+https://github.com/felipefacundes/cmd-fuzzy-finder.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/cmd-fuzzy-finder"
  
  # Install main script
  install -Dm755 cmd "$pkgdir/usr/bin/cmd"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install license if exists
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Optional: create man page
  # install -Dm644 cmd.1 "$pkgdir/usr/share/man/man1/cmd.1"
}

# vim:set ts=2 sw=2 et: