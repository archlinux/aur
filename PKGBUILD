# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=msty-deb
conflicts=('msty')
pkgver=2.1
pkgrel=2
pkgdesc="Msty Studio brings advanced AI capabilities to your fingertips. Run sophisticated AI workflows while keeping your data private and local."
arch=('x86_64')
url="https://msty.ai/"
license=('custom')   # Change as needed
depends=()          # List dependencies
source=("https://next-assets.msty.studio/app/latest/linux/MstyStudio_amd64.deb")
sha256sums=('521b7d2e23a456bec89cc8daa9b447f62ce2d1cb074840e6d4f23078a2b0c7e6') # Replace with actual checksum or use 'SKIP' for testing

package() {
    bsdtar -xOf "$srcdir/MstyStudio_amd64.deb" data.tar.xz | bsdtar -C "$pkgdir" -xv
}
