# Maintainer: Matthew Ellison <seglberg+aur(at)gmail(dot)com>

pkgname=google-cloud-sdk-bigtable-emulator
pkgver=326.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides local emulation of a Bigtable environment."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig_amd64.tar.gz"
)
sha256sums=('39276f75bcd50eae41d01883f0ddff38352f31b6ebe4e7323d85231812381504')

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/google-cloud-sdk" "${pkgdir}/opt"
  rmdir "${pkgdir}/opt/google-cloud-sdk/.install/.download"
}
