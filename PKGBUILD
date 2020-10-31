#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=6.1.1
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
sha256sums_i686=("62517057bedb4eaca0890cccb7e5c7e3ec66836f42d5ea26da58b4cc4872367a")
sha256sums_x86_64=("9ce8e3f4588a16188519edc29805494a8e0251da0b7a43c7d8e0e29045dba3cc")
sha256sums_armv6h=("199a235ad6a9d7e0e90bed8b0a1ffe29780349dc38a5bbaf6198ba090115e6e6")
sha256sums_armv7h=("0dda26282cc7903bc2cb7a6c120e7feecf9e0259756f4ef54f809ab81e5671d8")
sha256sums_aarch64=("e70b5ab6f585caabebd528f54bb6f3d71e80b3603a6a3cef2f4c4870fbe8d6e0")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
