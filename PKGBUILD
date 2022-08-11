# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Florian Léger <florian dot leger at insa dash rouen dot fr>

pkgname=soundfont-personalcopy
pkgver=5.1f
pkgrel=2
pkgdesc="A large free SoundFont"
arch=(any)
license=("custom")
url="http://www.personalcopy.com"
groups=('soundfonts')
sha256sums=('e69cf923897022dcf6416ab8d433f877a9f2734fde2ecaa0bb270a17ba63cd16')
source=("http://www.personalcopy.com/Downloads/PC${pkgver/./}.sf2.gz")

package() {
  cd "$srcdir"

  install -Dm644 "PC${pkgver/./}.sf2" "$pkgdir/usr/share/soundfonts/PC${pkgver/./}.sf2"
}
