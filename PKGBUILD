# Maintainer: eclairevoyant
_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.02
pkgrel=2
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=('any')
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/releases/download/v$pkgver/$_fontname"
        'LICENSE')
sha256sums=('0dfce49b773b1f94688f1225b538c09db3801317200b7360df4d53338fa7fec1'
            '5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_fontname
  install -Dm444 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
