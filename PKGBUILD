# Maintainer: Gastipatis <gastipatis@gmail.com>

pkgname=ttf-sitelen-seli-kiwen-juniko
pkgver=2.0
pkgrel=1
pkgdesc="Sitelen Seli Kiwen is a font created specially for Sitelen Pona writing system. Juniko variant."
url="https://www.kreativekorp.com/software/fonts/sitelenselikiwen"
arch=('any')
license=('OFL')
source=("https://github.com/kreativekorp/sitelen-seli-kiwen/releases/download/$pkgver/sitelenselikiwen.zip")
sha256sums=('c05be11d642cd33d3e9e1867556c2ecda3656a669f697e56515cf1127bbfeb20')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 sitelenselikiwenjuniko.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


