# Maintainer: Coobyk
# This file is rendered by .github/workflows/release.yml — pkgver and
# sha256sums are substituted there before the package is pushed to the AUR.
pkgname=rsusage-bin
pkgver=0.1.r1
pkgrel=1
pkgdesc="Blazing fast usage reports for coding agents - a Rust rewrite of ccusage (binary release)"
arch=('x86_64')
url="https://github.com/Coobyk/rsusage"
license=('MIT')
depends=('gcc-libs')
provides=('rsusage')
conflicts=('rsusage')
source=("$url/releases/download/v$pkgver/rsusage-linux-x86_64.tar.gz")
sha256sums=('532617a52fe3afa972677d2d920912d444f924ede0283a13a1a15a7208658e68')

package() {
    install -Dm755 rsusage "$pkgdir/usr/bin/rsusage"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
