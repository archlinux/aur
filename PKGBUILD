# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.004
pkgrel=2
pkgdesc='Adobe Source Han Sans fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
source=($pkgver-$pkgrel.zip::"https://github.com/redchenjs/source-han-sans-classic/releases/download/$pkgver/SourceHanSansC-OTF.zip")
sha512sums=('e926166645f488c231eaa32656f2ad057a829bc6125c9881db3eb778da8049c75a388396b132d6ff4489cecc73aa90040d3ff83b93fdfa661d3c8cdae9361f12')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
