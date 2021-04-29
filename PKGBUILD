# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-mono-classic-fonts
pkgver=1.002
pkgrel=7
pkgdesc='Adobe Source Han Mono fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-mono-classic"
license=('custom:OFL')
source=($pkgver.zip::"https://github.com/redchenjs/source-han-mono-classic/releases/download/$pkgver/source-han-mono-classic-otf.zip")
sha512sums=('95ac32419bb072b474755caee7424baf2ae5eec7a439ba7e4986cd0752e52192e5fcae2ade9c7fd508f68289d07e6d187f80178514f3ca97eea6e8d8dd4fe435')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
