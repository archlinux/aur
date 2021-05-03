# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=eslint_d
pkgver=10.0.4
pkgrel=1
pkgdesc="Makes eslint the fastest linter on the planet."
url="https://github.com/mantoni/${pkgname}"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=("94d6a47b9459bf527b9351d562309493fde25a64cf11bd4335c7f5dc798ddeb4")

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
}

