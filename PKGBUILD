# Contributor: feufochmar <feufochmar.gd@beleth.fr>

pkgname=ttf-gothica
pkgver=2.0.0
pkgrel=1
epoch=1
pkgdesc="Sans-serif font family used for stone carving works."
arch=('any')
url="https://fontlibrary.org/font/gothica"
license=('custom:OFL')
source=("$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/gothica/81df6a73c12ca8fc911125977e2e47c9/gothica.zip")
sha256sums=('c0d74753436459c4f55401cd4ad219f459992897153ee2bdb1e0d9117c05ae0c')

package() {
  cd Gothica
  install -Dm644 "SIL - Open Font License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}
