# Maintainer: George Thomas <georgefsthomas@gmail.com>
pkgname=ghciwatch-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Load a GHCi session for a Haskell project and reload it when source files change"
url="https://github.com/MercuryTechnologies/ghciwatch"
license=("MIT")
arch=("x86_64" "aarch64")
source_common="https://github.com/MercuryTechnologies/ghciwatch/releases/download/v$pkgver/ghciwatch-$arch-linux"
source_x86_64=($source_common)
source_aarch64=($source_common)
sha256sums_x86_64=("5417694e1ddf30d2a17e85e99092540329cea427f6bd52fb6f8c8d64dd25f434")
sha256sums_aarch64=("aecb0df1ced75a4a11dd0fe90d380948e714216f6a326129c31cd072148245dc")

package() {
    install -Dm755 ghciwatch-$arch-linux "$pkgdir/usr/bin/ghciwatch"
}
