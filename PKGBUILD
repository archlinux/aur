# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=stylish-haskell-bin
_pkgname=stylish-haskell
pkgver=0.14.3.0
pkgrel=1
pkgdesc='Haskell code prettifier. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/jaspervdj/stylish-haskell"
license=('BSD')
provides=('stylish-haskell')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch}.tar.gz")

sha256sums=('ce728a02b6e14be48f535929a154c1fbd7f565f9fb2734c4698689b5fc0cf3e5')

package() {
  cd "$srcdir/${_pkgname}-v${pkgver}-linux-${arch}"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

