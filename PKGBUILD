# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.1.0
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_linux_amd64.tar.gz")
sha1sums=('9cc74e1e60019567ef7a12f0ffeb19f6a2723486')

package() {
    tar -xzvf carapace-bin_${pkgver}_linux_amd64.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace-bin "${pkgdir}/usr/bin/carapace"
}
