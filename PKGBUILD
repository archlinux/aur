# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Tom Hudson <mail at tomnomnom dot com>

pkgname=assetfinder
pkgver=0.1.1
pkgrel=4
pkgdesc="Find domains and subdomains related to a given domain"
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/assetfinder"
license=('MIT')
conflicts=('assetfinder-git')

source_i686=(https://github.com/tomnomnom/assetfinder/releases/download/v${pkgver}/assetfinder-linux-386-${pkgver}.tgz)
source_x86_64=(https://github.com/tomnomnom/assetfinder/releases/download/v${pkgver}/assetfinder-linux-amd64-${pkgver}.tgz)

sha256sums_i686=('bc03f12a983dada6805d3634151d42c0833b20d7a254f9001e9ac9c18b366da5')
sha256sums_x86_64=('a7c61fe7b8ac16b35b94c1967dfabe0a536efd04283a3764226b30ff75472b20')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/assetfinder ${pkgdir}/usr/bin/${pkgname}
}

