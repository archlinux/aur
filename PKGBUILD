#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.1.1
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
sha256sums_i686=("1bff841b53f46f80f6c19673bbc983b1ddcd2d2f003b5b08cfda201e22ca7b25")
sha256sums_x86_64=("c3d6dbd3ca0bb803210b7b815577b68c378014bfc544f39a015da56a667be903")
sha256sums_armv6h=("1a75afb766bfddd8d094d498ccd277ac9a3de5c1e784367d45c05115a448db2c")
sha256sums_armv7h=("bfa3e4e7aef1fc9940060290f3558ee646843a9193fb26a1a678840b70bc6c65")
sha256sums_aarch64=("00a766324ab624024e97253c7fd43c20997d499d945cda212b0d32f0ffd45f81")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
