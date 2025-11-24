# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=msty-deb
conflicts=('msty')
pkgver=2.1.0
filename="MstyStudio_amd64_${pkgver}.deb"
pkgrel=3
pkgdesc="Msty Studio brings advanced AI capabilities to your fingertips. Run sophisticated AI workflows while keeping your data private and local."
arch=('x86_64')
url="https://msty.ai/"
license=('custom') # Change as needed
depends=()         # List dependencies
source=("$filename::https://next-assets.msty.studio/app/latest/linux/MstyStudio_amd64.deb?ver=$pkgver")
sha256sums=('5d72a41d0d1e784daf8fe12b83c678368ed79a49bc4c86e44ae1482487632752') # Replace with actual checksum or use 'SKIP' for testing

package() {
  bsdtar -xOf "$srcdir/$filename" data.tar.xz | bsdtar -C "$pkgdir" -xv
}
