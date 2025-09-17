# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.18.1
pkgrel=1
pkgdesc="Smart session manager for the terminal"
arch=("x86_64" "arm64" "i386")
url="https://github.com/joshmedeski/sesh"
license=("MIT")
depends=("zoxide" "tmux")
provides=('sesh')
conflicts=('sesh')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_arm64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f1b2a7f2f86840411d9706a3dad1bb73da09ceeddd107028a62277d8d3d28040')
sha256sums_arm64=('f1b2a7f2f86840411d9706a3dad1bb73da09ceeddd107028a62277d8d3d28040')
sha256sums_i386=('f1b2a7f2f86840411d9706a3dad1bb73da09ceeddd107028a62277d8d3d28040')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
