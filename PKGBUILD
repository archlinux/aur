# Maintainer: eclairevoyant
_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.03
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=('any')
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/releases/download/v$pkgver/$_fontname"
        'LICENSE')
sha256sums=('bc002d58f9309ff5ad463a780a60dc4cb1a8f33f0a4fd0517b8445d3b775092a'
            '5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_fontname
  install -Dm444 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
