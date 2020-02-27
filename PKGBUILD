# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=ttf-cardo
pkgver=1.04
pkgrel=2
pkgdesc="A font designed for classicists, Biblical scholars, medievalists, and linguists"
arch=('any')
url='http://scholarsfonts.net/cardofnt.html'
license=('OFL')
source=("http://scholarsfonts.net/cardo${pkgver/.}.zip"
        'license.txt')
sha256sums=('9401db6357cb71fa1f8791323679f81d6b0473d6280a7ec8abdf11b5e52f455f'
            '7b52a2e3b2c4d1f0df6861eb5f8863bc71d702af8a1e72c6f2cdec3352818633')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" Cardo*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" Manual*.pdf
}
