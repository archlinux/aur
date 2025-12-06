pkgname=clinotes
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, terminal-based notes manager written in Bash."
arch=('any')
url="https://github.com/simon-msdos/notes"
license=('GPL')
depends=('bash')

source=("https://raw.githubusercontent.com/simon-msdos/notes/main/notes.sh")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir"/usr/bin
  # Install the script as 'clinotes'
  install -m 755 "$srcdir"/notes.sh "$pkgdir"/usr/bin/clinotes
}
