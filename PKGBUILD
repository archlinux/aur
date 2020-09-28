# Maintainer: Zach Hoffman <zrhoffman@apache.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Matthew Longley <randomticktock@gmail.com>

pkgname=apache-flex-sdk-docs
pkgver=4.16.1
pkgrel=1
pkgdesc='Apache Flex SDK Documentation'
arch=('any')
url='https://flex.apache.org/download-binaries.html'
license=('APACHE')
options=('docs' '!strip')
source=("https://dist.apache.org/repos/dist/release/flex/${pkgver}/docs/apache-flex-sdk-${pkgver}-asdocs.zip")
sha256sums=('b8445b8a502f9064264528a8fda00f7810e23a90e112958dd444554e59b0cf29')
md5sums=('a3510fa8be6b94db18933a3d2e5a8c38')

package() {
  install -d "${pkgdir}"/opt/apache-flex-sdk
  cp -r asdoc "${pkgdir}"/opt/apache-flex-sdk/
}
