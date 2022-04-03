# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=stylish-haskell-bin
_pkgname=stylish-haskell
pkgver=0.14.1.0
pkgrel=1
pkgdesc='Haskell code prettifier. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/jaspervdj/stylish-haskell"
license=('BSD')
provides=('stylish-haskell')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch}.tar.gz")

sha256sums=('2fd6084e7c7fda8e7da1365ca1ab5ffe5a53791f645a74e3ee8e6cc2476ffd67')

package() {
  cd "$srcdir/${_pkgname}-v${pkgver}-linux-${arch}"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

