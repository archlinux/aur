#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=6.1.0
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
sha256sums_i686=("983c438f0d641ce8a9191b4f90dc3c0dc639815ae1d5c3d819d7a59725d5b900")
sha256sums_x86_64=("ada59d1198c431fb0bbdf3258e58e5c98963f81bb8f5628af61b646548b41c8b")
sha256sums_armv6h=("f106da9dd6c384f81deaa115a713d8dffd949d7ec0d1b66294372504c91d67ba")
sha256sums_armv7h=("85c6a6accb4cb3cf20c803d6998d8eb39c2a6142d1aed2c31b65974d7ee182aa")
sha256sums_aarch64=("471ac59487a95af0da5bd84d48802b42ecd36dd242ca9c0d2b9cc3ae0af18901")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
