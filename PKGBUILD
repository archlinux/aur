# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.7.4
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('378b19c582be3fcfb5da083f7a07a5ababa9f706ecf7fa7898232132ce477476')

package() {
    tar -xzvf carapace-bin_${pkgver}_Linux_${arch}.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace "${pkgdir}/usr/bin/carapace"
}
