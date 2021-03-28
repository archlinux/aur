# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.4.0
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_linux_amd64.tar.gz")
sha256sums=('25551d942b4244ad1720a041aa28b82d48486ce07d16089d46d1959de97cbedc')

package() {
    tar -xzvf carapace-bin_${pkgver}_linux_amd64.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace-bin "${pkgdir}/usr/bin/carapace"
}
