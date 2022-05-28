# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

pkgname=otf-playfair-display-sc
pkgver=1.202
pkgrel=1
pkgdesc='An Open Source typeface family for display and titling use with a transitional design.'
arch=('any')
url='https://github.com/clauseggers/Playfair-Display/'
source=("https://github.com/clauseggers/Playfair/archive/1.202.tar.gz")
license=('custom:OFL')
sha512sums=('8bf7d4c528d5dde8fa14a8a9379bc73f2809277bb19892027c02066b538d851b552e0dcba6bf44dd8b6953a906f00fd4244a563cde258c41b689826323d09366')

package() {
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF Playfair-$pkgver/fonts/CFF/PlayfairDisplaySC-*.otf
  install -Dm644 Playfair-$pkgver/OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
