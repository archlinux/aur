# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>
pkgname=boram
pkgver=0.3.7
pkgrel=1
pkgdesc="Cross-platform WebM converter"
arch=('x86_64')
url="https://github.com/Kagami/boram#readme"
license=('CC0-1.0')
depends=('mpv' 'ffmpeg')
source=(https://github.com/Kagami/boram/releases/download/v$pkgver/$pkgname-v$pkgver-linux-x64.7z)
md5sums=('9d7791778bc9a3477b216ac3a9b17dbc')

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin/"
  
  cp -r "$srcdir/$pkgname-v$pkgver-linux-x64/" "$pkgdir/opt/$pkgname"
  ln -s "$pkgdir/opt/$pkgname/boram" "$pkgdir/usr/bin/boram"
}
