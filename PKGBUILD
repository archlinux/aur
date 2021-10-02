# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.6.6
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('682ade18c2df8e08af72aeb6fa3943cad484045a3136c3d2fd2cb94ca7dc52de')

package() {
    tar -xzvf carapace-bin_${pkgver}_Linux_${arch}.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace "${pkgdir}/usr/bin/carapace"
}
