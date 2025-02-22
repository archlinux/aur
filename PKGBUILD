# Maintainer: George Thomas <georgefsthomas@gmail.com>
pkgname=ghciwatch-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Load a GHCi session for a Haskell project and reload it when source files change"
url="https://github.com/MercuryTechnologies/ghciwatch"
license=("MIT")
arch=("x86_64" "aarch64")
source_common="https://github.com/MercuryTechnologies/ghciwatch/releases/download/v$pkgver/ghciwatch-$arch-linux"
source_x86_64=($source_common)
source_aarch64=($source_common)
sha256sums_x86_64=("51e457131f7e428d73784946b2bbb42365c740fbceb546db45db30158fc21b9a")
sha256sums_aarch64=("6b5f1a979f6a51a9afe940478c03bc8b7cfdf6ae62d378b960c202910cb4b83d")

package() {
    install -Dm755 ghciwatch-$arch-linux "$pkgdir/usr/bin/ghciwatch"
}
