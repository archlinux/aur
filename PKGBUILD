# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.43
pkgrel=1
epoch=
pkgdesc="Spectre & Meltdown vulnerability/mitigation checker (CVE-2017-5753, CVE-2017-5715, CVE-2017-5754, CVE-2018-3640, CVE-2018-3639, CVE-2018-3615, CVE-2018-3620, CVE-2018-3646, CVE-2018-12126, CVE-2018-12130, CVE-2018-12127, CVE-2019-11091)"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/spectre-meltdown-checker/archive/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}

sha256sums=('b913f08e8380403c30f20e2c8763010db81a89cb2c5474ae54df1419644ad185')
