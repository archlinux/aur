# Maintainer: plasmaofthedawn <plasmaofthedawn@gmail.com>

pkgname=ttf-sitelen-seli-kiwen-asuki
pkgver=2.3
pkgrel=1
pkgdesc="Sitelen Seli Kiwen is a font created specially for Sitelen Pona writing system. Asuki variant."
url="https://www.kreativekorp.com/software/fonts/sitelenselikiwen"
arch=('any')
license=('OFL')
source=("https://github.com/kreativekorp/sitelen-seli-kiwen/releases/download/$pkgver/sitelenselikiwen.zip")
sha256sums=('3b88e0f9389b48e18df331747c73888941e4b46f36b9bc64a9e0f9b2e0a5cff8')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 sitelenselikiwenasuki.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 sitelenselikiwenmonoasuki.ttf -t "$pkgdir/usr/share/fonts/TTF"
   
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


