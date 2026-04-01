# Maintainer: Wayne Martin <ghwinslow1700@hotmail.com>
pkgname=breachcheck
pkgver=0.1.0
pkgrel=1
pkgdesc="Privacy-first password breach checker using HaveIBeenPwned k-anonymity — your password never leaves your machine"
arch=('x86_64')
url="https://github.com/Wtmartin8089/breachcheck"
license=('MIT')
provides=('breachcheck')
conflicts=('breachcheck-git')
source=(
    "$pkgname-$pkgver::$url/releases/download/v$pkgver/$pkgname"
    "LICENSE::$url/raw/main/LICENSE"
)
sha256sums=(
    '759d2a25bf57a3ecf775891aa00e7cc7c025acd5d8c7c6ae7b6135b146c6a07e'
    'SKIP'
)

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
