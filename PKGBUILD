pkgname=gvm-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Gradle version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source_x86_64=("gvm-1.0.3-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.3/gvm-1.0.3-linux-x86_64.tar.gz")
sha256sums_x86_64=('bf6dc15346c0f2d3571fc9c9f54812fdfc4d2f6a215dc66feed94c9f9697bf35')
source_aarch64=("gvm-1.0.3-linux-aarch64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.3/gvm-1.0.3-linux-aarch64.tar.gz")
sha256sums_aarch64=('e207fa46723077df7ec4734a7627f454babfb61162404e9e0439fcd756fff2e6')

package() {
  archive_dir="gvm-1.0.3-linux-${CARCH}"
  install -Dm755 "${srcdir}/${archive_dir}/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/${archive_dir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${archive_dir}/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
