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
depends=()
provides=('rsusage')
conflicts=('rsusage')
source=("$url/releases/download/v$pkgver/rsusage-linux-x86_64.tar.gz")
sha256sums=('542c7573e67beb65651df7c02e22e41a9e6c76e360583aa586259db893b44ddc')

package() {
    install -Dm755 rsusage "$pkgdir/usr/bin/rsusage"
}
