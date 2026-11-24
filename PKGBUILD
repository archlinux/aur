# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sox-vulkan-bin
pkgver=16.2.4
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
sha256sums_aarch64=('4fe86f3f043554f969e5023cbe2af6896535734b45fb696516bd3f634b91d80a')
sha256sums_x86_64=('50cd25a1ec16dbd2d002f3d7acb84805ab9b4cb75be12920043d7201e6db4605')


package() {
  install -Dm755 "$srcdir/sox-vulkan" "$pkgdir/usr/bin/sox-vulkan"
}
