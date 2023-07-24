# Maintainer: Gastipatis <gastipatis@gmail.com>

pkgname=ttf-sitelen-seli-kiwen-asuki
pkgver=1.2.1
pkgrel=1
pkgdesc="Sitelen Seli Kiwen is a font created specially for Sitelen Pona writing system. Asuki variant."
url="https://www.kreativekorp.com/software/fonts/sitelenselikiwen"
arch=('any')
license=('OFL')
source=("https://github.com/kreativekorp/sitelen-seli-kiwen/releases/download/$pkgver/sitelenselikiwen.zip")
sha256sums=('F3A8F36CD5666C2DB6DBC061879F8A3DD2E7E64EA022CEE0394D4461FFEB992D')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 sitelenselikiwenasuki.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


