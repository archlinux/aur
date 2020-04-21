#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=6.0.1
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
sha256sums_i686=("7b5f91e6c7c04cb6764cd21aa6905afe5d8c9f463cdb135a9d1e4ab5e8a49e9c")
sha256sums_x86_64=("4a4dbe96aaa098b40488087a51cd8ee29ded8e0f4400520126fe8616c48ac0c5")
sha256sums_armv6h=("96e9ca5e184cb6647ef121c9339644d58182d5eed4e74762b73d801cc19ecd8a")
sha256sums_armv7h=("674d387a7819b3558c209c54e0b22c36d455a07b52585ffa26c82075fafd3b34")
sha256sums_aarch64=("9a3824d02598bfada2627c5840f0bd03653aad17f71ceff3c5341c2bff65b1f2")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
