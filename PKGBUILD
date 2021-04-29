# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-serif-classic-fonts
pkgver=1.001
pkgrel=6
pkgdesc='Adobe Source Han Serif fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-serif-classic"
license=('custom:OFL')
source=($pkgver.zip::"https://github.com/redchenjs/source-han-serif-classic/releases/download/$pkgver/source-han-serif-classic-otf.zip")
sha512sums=('0d2243c06883eff7e5c2ce8c77813bd94611263c7946fdfd63cb6e3982e403c6c4d0e30a7aa97a9a54bff7fbca3bcde7018d557c4c48f3ca34253e767063b2c8')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-serif"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-serif/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
