#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.3.1
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
sha256sums_i686=("bbea1cbf1e520629b33a3d86cff64fee100530fd0c599aab915c415564235140")
sha256sums_x86_64=("ab58ef6085794ad1ce99cd59a6c59959aa5f7320c7c34d96af730afb4c05800f")
sha256sums_armv6h=("5f23fdf4e2cf2b7860c1d4366018a3e416cc47899e29b704fa8e217873571a88")
sha256sums_armv7h=("45d1a682ddfd9b2178356d2de1ad94d40801ed76d11ca2f880a5abfbb30ada59")
sha256sums_aarch64=("73d424cee0df8e0015bbaef70d9bdb99837bd028b076e0bba801cb34ddb5a0b2")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
