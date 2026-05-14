pkgname=gvm-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Gradle version manager'
arch=('x86_64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source=("gvm-1.0.0-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-x86_64.tar.gz")
sha256sums=('cd4ea5eeb33739a069bf002c0a6c1a3430764b24a0609d9f52f8fb48f1818e85')

package() {
  install -Dm755 "${srcdir}/gvm-1.0.0-linux-x86_64/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/gvm-1.0.0-linux-x86_64/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/gvm-1.0.0-linux-x86_64/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/gvm-1.0.0-linux-x86_64/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
