# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=fontforge-cidmap
pkgver=20201107
pkgrel=1
pkgdesc='Cidmaps for FontForge'
arch=('any')
url="https://github.com/fontforge/fontforge"
license=('custom')
source=("https://github.com/fontforge/fontforge/releases/download/$pkgver/fontforge-$pkgver.tar.xz")
sha512sums=('cf9666395405ab02943f0160959f04251bd2a80e279a8f60431089ad19a4c5a232efd42097050ed9f6c1fb39d01488176262949fd81f5f0960fe853b497437dc')

package() {
  cd "$srcdir/fontforge-$pkgver/contrib/cidmap"

  install -dm755 "$pkgdir/usr/share/fontforge"
  install -Dm644 *.cidmap "$pkgdir/usr/share/fontforge/"
}
