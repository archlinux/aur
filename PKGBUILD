#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.1.0
pkgrel=2
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
sha256sums_i686=("fe99396d25e827d8fc0332b0a1846493551de65451c123566f33e22a1e8ce23e")
sha256sums_x86_64=("c53e5352df6ed631d7f4ec7ce90bc66754fc9ed20531d8f97e675e5ca53bda80")
sha256sums_armv6h=("58bb52dba25b7e3921f0659a82737dc5aaad1bf3c95ae9902c9560314f6012da")
sha256sums_armv7h=("50e03b3e3c17c527fa66e24f5bbb86c59f3f682e88789950323007d104d857e9")
sha256sums_aarch64=("c407bc073e639bfb6e57c9dab2fa5a9b6726fc52c273575dc69d76dc333de456")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
