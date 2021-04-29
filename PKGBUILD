# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.004
pkgrel=1
pkgdesc='Adobe Source Han Sans fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
source=($pkgver.zip::"https://github.com/redchenjs/source-han-sans-classic/releases/download/$pkgver/source-han-sans-classic-otf.zip")
sha512sums=('85d0580d8d74fda42f32bbeb8aa5636ddda31332b2e99f007d1adf1566db8bab63ce3f13231206e8212a791df2f7c5179d6aa7812d9e270302f0a870907ad4fb')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
