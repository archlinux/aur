# Maintainer: plasmaofthedawn <plasmaofthedawn@gmail.com>

pkgname=ttf-sitelen-seli-kiwen-asuki
pkgver=2.1
pkgrel=1
pkgdesc="Sitelen Seli Kiwen is a font created specially for Sitelen Pona writing system. Asuki variant."
url="https://www.kreativekorp.com/software/fonts/sitelenselikiwen"
arch=('any')
license=('OFL')
source=("https://github.com/kreativekorp/sitelen-seli-kiwen/releases/download/$pkgver/sitelenselikiwen.zip")
sha256sums=('219837b9e049da003896e0e17aca3bdd60fd1d23e31d6ba0bb9845f377f06830')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 sitelenselikiwenasuki.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 sitelenselikiwenmonoasuki.ttf -t "$pkgdir/usr/share/fonts/TTF"
   
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


