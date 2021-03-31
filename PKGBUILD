# Maintainer: dilipvamsi <m.dilipvamsi at gmail dot com>

_pkgname='arangodb'
pkgname="${_pkgname}-client-bin"
pkgdesc="Arangodb client library."
pkgver=3.7.10
pkgrel=1
_pkgver='3.7.10-1'
_arangodb_version='37'
arch=('x86_64')
url="https://www.arangodb.com/"
license=('APACHE')
provides=(${_pkgname})
conflicts=(
    "${_pkgname}"
    "${_pkgname}-bin"
)
source=(
    https://download.arangodb.com/arangodb${_arangodb_version}/Community/Linux/arangodb3-client_${_pkgver}_amd64.deb
)
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha256sums=(
    0512df84357a59aec1f9b5b198b8fa610cc83fffab52e500da3cd47660c6c002
)
package() {
    msg2 "Extracting the data.tar.gz..."
    tar -xf "data.tar.gz" -C "${pkgdir}"
}
