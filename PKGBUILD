# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.6.11
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('30d868a58c4914f8064b63d4ac2f68aa31dac84f72033048e7d945628da497de')

package() {
    tar -xzvf carapace-bin_${pkgver}_Linux_${arch}.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace "${pkgdir}/usr/bin/carapace"
}
