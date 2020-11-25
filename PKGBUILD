# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-serif-classic-fonts
pkgver=1.001
_commit=82d81c4df7d34763ec81348e3d9e0e79388cc4a8
pkgrel=5
pkgdesc='Adobe Source Han Serif fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-serif-classic"
license=('custom:OFL')
source=("https://github.com/redchenjs/source-han-serif-classic/archive/$_commit/source-han-serif-classic-$_commit.tar.gz")
sha512sums=('c29c42259bccef8b84e54312f3c9e64775dc0ce16d12ddf0ddf4fe64e637aa305c5657425953993eec449e07eeab8cefa696ffc3301e848c8cd59be778ec133d')

package() {
  cd "source-han-serif-classic-$_commit"

  mkdir -p "$pkgdir/usr/share/fonts/adobe-source-han-serif"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-serif/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
