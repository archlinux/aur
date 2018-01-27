# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.33
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

sha1sums=('552c54ef51bff47c0efe3cd015969df314d3632b')
sha256sums=('50b4a968616af99eecbcf260953e52eb86f7151c8d23044090ce4f04429aff59')
