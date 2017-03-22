# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=bluemix-cli
pkgver=0.5.1
pkgrel=1
pkgdesc="Interact with your applications, virtual servers, containers, and other components in IBM Bluemix."
arch=('x86_64')
url="http://clis.ng.bluemix.net/ui/home.html"
license=('CUSTOM')
depends=('cloudfoundry-cli>=6.1')
source=("http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${pkgver}_amd64.tar.gz")
sha256sums=('9f378b9f4fb6b98ac48e5f1a972dffa88b1874aa3f71c5c4d037b7782f9d6775')

package() {
  cd "${srcdir}/Bluemix_CLI/"

  install -Dm755 "bin/bluemix" "${pkgdir}/usr/bin/bluemix"
  install -Dm755 "bin/bluemix-analytics" "${pkgdir}/usr/bin/bluemix-analytics"
  install -Dm644 "bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
