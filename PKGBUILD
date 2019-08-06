# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=lokalise
pkgrel=1
pkgver=0.711
pkgdesc="Command-line tool to automate project file export and import for lokalise.co."
url="https://lokalise.co"
arch=('x86_64')
license=('custom')
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://s3-eu-west-1.amazonaws.com/lokalise-assets/cli/lokalise-${pkgver}-linux-amd64.tgz"
)
sha256sums=('ebdafb558247c77889abe3941c62cc13b1425f699c24b3fb6d82c7ea38d87462')

package() {
    install -D -m 755 "${srcdir}/lokalise" "${pkgdir}/usr/bin/lokalise"
}
