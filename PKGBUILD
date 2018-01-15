# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.31
pkgrel=1
epoch=
pkgdesc="Spectre & Meltdown vulnerability/mitigation checker (CVE-2017-5753, CVE-2017-5715, CVE-2017-5754)"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=('GPL3')
source=("https://github.com/speed47/spectre-meltdown-checker/archive/v$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker.sh"
}
sha1sums=('a462d316d147eb84e1cf6f08ac80696619934be6')
sha256sums=('8687e9b908a0fb6e996682323793e815137b18bce80816424cf29717aa304ef0')
