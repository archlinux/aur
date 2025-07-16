pkgname=otf-firamath
pkgver=v0.3.4
pkgrel=1
pkgdesc="Fira Math is a sans-serif font with Unicode math support"
arch=(any)
license=(custom:ofl)
depends=()
source=("https://github.com/firamath/firamath/releases/download/$pkgver/FiraMath-Regular.otf")
url="https://github.com/firamath"
md5sums=(bc0416de599a48532457e00d64f6695b)

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "$srcdir"/*.otf
}
