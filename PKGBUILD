# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sox-vulkan-bin
pkgver=16.2.2
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
sha256sums_aarch64=('213bb1f7958a9a4c084578c814ecd8ad47174c1de440403e9659cc9f5fac4b1e')
sha256sums_x86_64=('262e0a0dc1b8bc8deeec0f9e7869c1626dbf6f115a6a73d59b3976e32c95b0f0')


package() {
  install -Dm755 "$srcdir/sox-vulkan" "$pkgdir/usr/bin/sox-vulkan"
}
