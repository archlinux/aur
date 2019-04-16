# Maintainer: Daniel Kronberg <danikron at protonmail dot com>
pkgname=otf-font-awesome-5-free
pkgver=5.8.1
pkgrel=1
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.com/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.zip::https://use.fontawesome.com/releases/v5.8.1/fontawesome-free-5.8.1-desktop.zip"
		"OFL")
sha256sums=('888f7ff14cfbd31d4ae1e59a65f1037ed0c5460ba2a9480cda1d7d454ed31e16'
            'e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602')

package() {
  install -Dm644 OFL "$pkgdir/usr/share/licenses/$pkgname/OFL"
  cd "fontawesome-free-$pkgver-desktop/otfs"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}
