# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.40
pkgrel=1
epoch=
pkgdesc="Spectre & Meltdown vulnerability/mitigation checker (CVE-2017-5753, CVE-2017-5715, CVE-2017-5754, CVE-2018-3640, CVE-2018-3639, CVE-2018-3615, CVE-2018-3620, CVE-2018-3646)"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/spectre-meltdown-checker/archive/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}

sha256sums=('53a597d030e9e3f02e7dd68ddf6c12ddb47ef5ff86ce1b351dd5fb3805114b07')
