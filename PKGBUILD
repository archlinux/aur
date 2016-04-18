# Contributor: TDY <tdy@gmx.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-cardo
pkgver=1.04
pkgrel=1
pkgdesc="A large Unicode font specifically designed for the needs of classicists, Biblical scholars, medievalists, and linguists."
arch=('any')
url="http://scholarsfonts.net/cardofnt.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("http://scholarsfonts.net/cardo${pkgver/.}.zip"
        license.txt)
md5sums=('e48dadccd31a74667b0369d7e98e660f'
         '824f1c5112f0ff4062d636ab04a9a441')
sha1sums=('fb156361986052071fa8df09ab6c95749c5dad07'
          '07d3bfb99bc363ddca10b4307b2c9e88242e6931')
sha256sums=('9401db6357cb71fa1f8791323679f81d6b0473d6280a7ec8abdf11b5e52f455f'
            '7b52a2e3b2c4d1f0df6861eb5f8863bc71d702af8a1e72c6f2cdec3352818633')

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 Cardo*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

