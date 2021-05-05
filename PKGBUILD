# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.4.8
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_linux_amd64.tar.gz")
sha256sums=('e6a0378e760b8f61c0f4a2856cc1ef9c059cf0dcbc0a7f44daf27eb019787a3a')

package() {
    tar -xzvf carapace-bin_${pkgver}_linux_amd64.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace-bin "${pkgdir}/usr/bin/carapace"
}
