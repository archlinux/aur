# Maintainer: Coobyk
# This file is rendered by .github/workflows/release.yml — pkgver and
# sha256sums are substituted there before the package is pushed to the AUR.
pkgname=rsusage-bin
pkgver=0.2.4
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
sha256sums=('acbcd4e1fcb0a4d65981ccb86c6b11ba43d439ef36dd385ad19c47ba02658a0b')

package() {
    install -Dm755 rsusage "$pkgdir/usr/bin/rsusage"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
