pkgname=crdir
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple tool to create folders and then, CD into the folder."
arch=('x86_64')
url="https://github.com/ghosty309/crdir"
license=('MIT')
depends=('python')
source=("https://github.com/ghosty309/crdir/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}/crdir" "$pkgdir/usr/bin/crdir"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/src/main.py" "$pkgdir/usr/share/${pkgname}/main.py"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

