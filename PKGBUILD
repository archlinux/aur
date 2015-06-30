# Maintainer: Matthew Longley <randomticktock@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=apache-flex-sdk-docs
pkgver=4.14.1
pkgrel=1
pkgdesc='Apache Flex SDK Documentation'
arch=('any')
url='http://flex.apache.org/download-binaries.html'
license=('APACHE')
options=('docs' '!strip')
source=("http://www.eu.apache.org/dist/flex/${pkgver}/docs/apache-flex-sdk-${pkgver}-asdocs.zip")
md5sums=('b7e20cf27fa59f64f4798950a227cf47')

package() {
  install -d "${pkgdir}"/opt/apache-flex-sdk
  cp -r asdoc "${pkgdir}"/opt/apache-flex-sdk/
}
