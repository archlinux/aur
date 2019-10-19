#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="Antibody is a shell plugin manager made from the ground up thinking about performance"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('antibody')
source_i686=("$pkgname-$pkgver.tar.gz::https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_i386.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_x86_64.tar.gz")
source_armv6h=("$pkgname-$pkgver.tar.gz::https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_armv6.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_armv7.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_arm64.tar.gz")
url="https://github.com/getantibody/antibody"
license=("MIT")
sha256sums_i686=("148ea5224d35361364e81be7fffd30de22502145c3d9d0bff54aa55029c7bef5")
sha256sums_x86_64=("135827f8973d9716f7861221ec47b6b4f9a9c14b9ce7df62d2d71487fee15d5b")
sha256sums_armv6h=("55dba88d26763291f70f7fb44b34dd0c7a278243eaa57b45de20490a699f095e")
sha256sums_armv7h=("5360ee6c49167f0391e20f25a31776d947819342080a5075be7a5db054ee78d4")
sha256sums_aarch64=("ea618d1712995e0b3e8b6e561688b1715f5be81e8d3b4c0384d246f09f189e54")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
