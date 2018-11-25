#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="Antibody is a shell plugin manager made from the ground up thinking about performance"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('antibody')
source_i686=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_i386.tar.gz")
source_x86_64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_x86_64.tar.gz")
source_armv6h=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_armv7.tar.gz")
source_aarch64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_arm64.tar.gz")
url="https://github.com/getantibody/antibody"
license=("MIT")
sha256sums_i686=("ddbabb04a73c138c222e40d76a5a3223e25604802992a3eb8681e60889adae55")
sha256sums_x86_64=("774196b5c349987b2bd5b5bdb679175ab581cbd7590654139958560cb7ed5685")
sha256sums_armv6h=("f7aa109fd081681c21c8c6dfcc14ec4dfbbcd295755c7760cd746ebc6757a222")
sha256sums_armv7h=("3df2957b85c44474f48631bd6fd185ba0276ddae0d2e8d12cb0c1f1369baa951")
sha256sums_aarch64=("e5e98fec324ab14d87791203f705c7f5828da66471023fa385738fa62a63c4a5")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
