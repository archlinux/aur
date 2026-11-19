# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sox-vulkan-bin
pkgver=16.2.3
pkgrel=1
pkgdesc="Sound eXchange (sox) with Vulkan acceleration"
arch=('aarch64' 'x86_64')
url="https://github.com/simonefil/sox-vulkan"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('glibc' 'libgcc' 'libstdc++' lib{asound,gomp,vulkan}.so)
provides=("sox-vulkan=$pkgver")
conflicts=('sox-vulkan')
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/simonefil/sox-vulkan/releases/download/sox-${pkgver}/sox-vulkan-linux-aarch64.zip")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/simonefil/sox-vulkan/releases/download/sox-${pkgver}/sox-vulkan-linux-amd64.zip")
sha256sums_aarch64=('50d69aaae94f621d60992c9d3b045c822c4506053eba2819b341468421788be2')
sha256sums_x86_64=('3b08dfe6362d935ef58764f95b7e943d4f5086da94910fbc6da1b49bb560eae5')


package() {
  install -Dm755 "$srcdir/sox-vulkan" "$pkgdir/usr/bin/sox-vulkan"
}
