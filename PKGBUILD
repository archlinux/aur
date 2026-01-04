pkgname=soeder-flag
pkgver=1.0
pkgrel=2
pkgdesc="Terminal animation mit Farben"
arch=('any')
url="https://github.com/bayernliebe918-source/soeder_flag"
license=('MIT')
depends=('python' 'python-pyfiglet' 'python-colorama')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/soeder_flag"

  # soeder_flag.py wird ins System-Bin-Verzeichnis kopiert und ausführbar gemacht
  install -Dm755 soeder_flag.py "$pkgdir/usr/bin/soeder-flag"

  # README ins doc-Verzeichnis
  install -Dm644 README.md "$pkgdir/usr/share/doc/soeder-flag/README.md"
}
