# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=stylish-haskell-bin
_pkgname=stylish-haskell
pkgver=0.14.4.0
pkgrel=1
pkgdesc='Haskell code prettifier. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/jaspervdj/stylish-haskell"
license=('BSD')
provides=('stylish-haskell')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch}.tar.gz")

sha256sums=('fb4d544052c167641415231c5a2eccbad1b6d9c38f08019143be4c4f7cb0cef5')

package() {
  cd "$srcdir/${_pkgname}-v${pkgver}-linux-${arch}"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

