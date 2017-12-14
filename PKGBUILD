# Maintainer: Daniel Kronberg <danikron at protonmail dot com>
pkgname=otf-font-awesome-5-free
pkgver=5.0.1
pkgrel=1
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.com/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.zip::https://use.fontawesome.com/releases/v5.0.1/fontawesome-free-$pkgver.zip"
		"OFL")
sha256sums=('a222e02548f05b373a12417a41fa6849850f03e3c46869c15912599049eb900c'
			'e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602')

package() {
  install -Dm644 OFL "$pkgdir/usr/share/licenses/$pkgname/OFL"
  cd "fontawesome-free-$pkgver/use-on-desktop"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}
