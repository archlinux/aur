# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.7.3
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('bd2d5b7d92eaa8de2e4dd7988a0058837c268369f3d7b5b41190280b889a57a1')

package() {
    tar -xzvf carapace-bin_${pkgver}_Linux_${arch}.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace "${pkgdir}/usr/bin/carapace"
}
