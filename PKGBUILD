# Maintainer: Coobyk
# This file is rendered by .github/workflows/release.yml — pkgver and
# sha256sums are substituted there before the package is pushed to the AUR.
pkgname=rsusage-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Blazing fast usage reports for coding agents - a Rust rewrite of ccusage (binary release)"
arch=('x86_64')
url="https://github.com/Coobyk/rsusage"
license=('MIT')
depends=('gcc-libs')
provides=('rsusage')
conflicts=('rsusage')
# versioned asset name keeps helpers' source caches distinct per release
source=("$url/releases/download/v$pkgver/rsusage-$pkgver-linux-x86_64.tar.gz")
sha256sums=('c4e95c8f14ddc9bcfb13eab0bdad880cf6c3e27e21ff17dfddb78056d5e00fe2')

package() {
    install -Dm755 rsusage "$pkgdir/usr/bin/rsusage"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
