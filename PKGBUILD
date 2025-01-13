# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.57.4
pkgrel=1
pkgdesc="Porter-dev CLI"
arch=('x86_64')
url="https://www.porter.run/"
license=('custom:porter')
source=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_amd64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_amd64"
)
sha256sums=(
'e1d30ba4931cdd4b387e2f6d1d15caec6e7cf421b4c212fbcb0e1fee3090aaa1'
'970f89faa3c31ebd520b53a6589c82daca95fa4999d4a0ec1d4a40faa1265f85'
)

package() {
  install -Dm755 "${srcdir}/porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/porter"
  install -Dm755 "${srcdir}/docker-credential-porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/docker-credential-porter"
}
