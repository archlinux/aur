# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=msty-deb
conflicts=('msty')
pkgver=2.1.3
filename="MstyStudio_amd64_${pkgver}.deb"
pkgrel=2
pkgdesc="Msty Studio brings advanced AI capabilities to your fingertips. Run sophisticated AI workflows while keeping your data private and local."
arch=('x86_64')
url="https://msty.ai/"
license=('custom') # Change as needed
depends=()         # List dependencies
source=("$filename::https://next-assets.msty.studio/app/latest/linux/MstyStudio_amd64.deb?ver=$pkgver")
sha256sums=('9c97cb6331997848e5c9cba125b9c035456f98a809510b7d462bb7499013c0d8') # Replace with actual checksum or use 'SKIP' for testing

package() {
  bsdtar -xOf "$srcdir/$filename" data.tar.xz | bsdtar -C "$pkgdir" -xv
}
