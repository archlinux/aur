# Maintainer: dilipvamsi <m.dilipvamsi at gmail dot com>

_pkgname='arangodb'
pkgname="${_pkgname}-client-bin"
pkgver=3.4.7
pkgrel=1
_pkgver='3.4.7-1'
pkgdesc="Arangodb client library."
arch=('x86_64')
url="https://www.arangodb.com/"
license=('APACHE')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(
    https://download.arangodb.com/arangodb34/Community/Linux/arangodb3-client_${_pkgver}_amd64.deb
)
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha256sums=(
    5165cf74818560799f9f307d139e65f1fdd489703643597e82473877cafba230
)
package() {
    msg2 "Extracting the data.tar.gz..."
    tar -xf "data.tar.gz" -C "${pkgdir}"
}
