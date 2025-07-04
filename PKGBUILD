# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.17.0
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
sha256sums_x86_64=('540aafdf4b79ab5c3be040f8f829aaff424c42787adff8b130c46f5c04a58c01')
sha256sums_arm64=('540aafdf4b79ab5c3be040f8f829aaff424c42787adff8b130c46f5c04a58c01')
sha256sums_i386=('540aafdf4b79ab5c3be040f8f829aaff424c42787adff8b130c46f5c04a58c01')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
