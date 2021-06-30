# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.5.2
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('e2591a82a8db0a6f3e9820db05910dfc1108a66b4ee1b36e511b58d2f2aa5ade')

package() {
    tar -xzvf carapace-bin_${pkgver}_Linux_${arch}.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace "${pkgdir}/usr/bin/carapace"
}
