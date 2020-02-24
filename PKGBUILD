# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: chongli <kurto@mac.com>

pkgname=otf-montserrat
_pkgname=Montserrat
pkgver=7.200
pkgrel=4
pkgdesc='Geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky'
url="https://github.com/JulietaUla/$_pkgname"
arch=('any')
license=('OFL')
source=("https://github.com/JulietaUla/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('340125df4700876c5adf4df98c885dbe9b96c8a6a0ee634a520934c77ee097dc')

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/$_pkgname*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHOR.txt CONTRIBUTORS.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md DESCRIPTION.en_us.html
}
