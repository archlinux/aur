# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.3.2
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/rsteube/carapace-bin/releases/download/v${pkgver}/carapace-bin_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d551ffb4150dcd89ba6148af3ce065481c5d43ca4199730912fa38790bb04b56')

package() {
    tar -xzvf carapace-bin_${pkgver}_linux_amd64.tar.gz
    mkdir -p "${pkgdir}/usr/bin"
    cp carapace-bin "${pkgdir}/usr/bin/carapace"
}
