# Maintainer: Matthew Ellison <seglberg+aur(at)gmail(dot)com>

pkgname=google-cloud-sdk-cbt
pkgver=326.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides the cli for Cloud Bigtable."
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
sha256sums=('150000b02628ee7f6442e1f24f90e7187393e1e3cbb1c0eeafaa01547455149e')

package() {
  rm -rf "${srcdir}/.install"
  mkdir -p "${pkgdir}/opt"
  cp -r "${srcdir}/google-cloud-sdk" "${pkgdir}/opt/google-cloud-sdk"
}
