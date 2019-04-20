# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=lokalise
pkgrel=1
pkgver=0.69
pkgdesc="Command-line tool to automate project file export and import for lokalise.co."
url="https://lokalise.co"
arch=('x86_64')
license=('custom')
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://s3-eu-west-1.amazonaws.com/lokalise-assets/cli/lokalise-${pkgver}-linux-amd64.tgz"
)
sha256sums=('f98bb17506e14dd0f94a066fac5e3b529e54a4d9c437f53d6853bbe4567f72bf')

package() {
    install -D -m 755 "${srcdir}/lokalise" "${pkgdir}/usr/bin/lokalise"
}
