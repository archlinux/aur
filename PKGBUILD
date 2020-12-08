# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.1.10
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_linux_amd64.tar.gz")
sha1sums=('520d47ba03a07b3ae9491989b7346975210f89dd')

package() {
    tar -xzvf carapace-bin_${pkgver}_linux_amd64.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace-bin "${pkgdir}/usr/bin/carapace"
}
