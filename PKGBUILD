# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=lokalise
pkgrel=1
pkgver=0.721
pkgdesc="Command-line tool to automate project file export and import for lokalise.co."
url="https://lokalise.co"
arch=('x86_64')
license=('custom')
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://s3-eu-west-1.amazonaws.com/lokalise-assets/cli/lokalise-${pkgver}-linux-amd64.tgz"
)
sha256sums=('9913e9fe29dbb38c35a5acacbdac30282071f9be5fc99b944fc6ae7f5366e5e8')

package() {
    install -D -m 755 "${srcdir}/lokalise" "${pkgdir}/usr/bin/lokalise"
}
