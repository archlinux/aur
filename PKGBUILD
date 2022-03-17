# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=stylish-haskell-bin
_pkgname=stylish-haskell
pkgver=0.14.0.1
pkgrel=1
pkgdesc='Haskell code prettifier. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/jaspervdj/stylish-haskell"
license=('BSD')
provides=('stylish-haskell')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch}.tar.gz")

sha256sums=('87f922598c4ea58fb70590c10d39cbe1f22d4e6411a8b7d0edd7c5bbebc4ce10')

package() {
  cd "$srcdir/${_pkgname}-v${pkgver}-linux-${arch}"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

