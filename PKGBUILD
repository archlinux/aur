# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.32
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

sha1sums=('4f4317ec7f5470a79fd1feb1a23d578c27acf92b')
sha256sums=('e999cb735cdbedde9e8577ece601810e8d11cd55d638456b59e6fe70e45ef695')
