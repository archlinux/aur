# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.23.0
pkgrel=1
pkgdesc="Smart session manager for the terminal"
arch=("x86_64" "aarch64" "i686")
url="https://github.com/joshmedeski/sesh"
license=("MIT")
depends=("zoxide" "tmux")
provides=('sesh')
conflicts=('sesh')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('8f6024a1d51b1b1b0710689c43c5f05d691ed0af516d6d9f1342abec8a40a420')
sha256sums_aarch64=('8f6024a1d51b1b1b0710689c43c5f05d691ed0af516d6d9f1342abec8a40a420')
sha256sums_i686=('8f6024a1d51b1b1b0710689c43c5f05d691ed0af516d6d9f1342abec8a40a420')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
