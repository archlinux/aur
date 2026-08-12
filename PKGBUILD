pkgname=gvm-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Gradle version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source_x86_64=("gvm-1.0.2-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.2/gvm-1.0.2-linux-x86_64.tar.gz")
sha256sums_x86_64=('08061b5a7eb4187682e5d8aabca2bc202a9e0292465a1663c255bce0fe57fa46')
source_aarch64=("gvm-1.0.2-linux-aarch64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.2/gvm-1.0.2-linux-aarch64.tar.gz")
sha256sums_aarch64=('48ed1ffa14a0ca7e41a87263bae92f9951784eed2e554fd14aef89d4f05f200c')

package() {
  archive_dir="gvm-1.0.2-linux-${CARCH}"
  install -Dm755 "${srcdir}/${archive_dir}/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/${archive_dir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${archive_dir}/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
