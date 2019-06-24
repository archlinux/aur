#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.1.2
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
sha256sums_i686=("702a7d6fa1cffe57b7150cc88c2322d6a8d9936806053f4792005a94fc729bd3")
sha256sums_x86_64=("1653956d82dfc4a57a417205dbea65074a012d1ba038aca6f5f34db8af993b78")
sha256sums_armv6h=("c9bbd8c6c5731398d7abd30c8c3635e2c1e64de00239a92fc951e9464995e9a6")
sha256sums_armv7h=("b724894b0492be1c09fff951da0ff9d9242b6265af6ab3bc2da440c4cf710e90")
sha256sums_aarch64=("03e793c29db868cd1280057db30d3c616db5c73cb8ea11ee544182c856ee2dd7")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
