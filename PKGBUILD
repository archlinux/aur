# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.32.0
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
sha256sums_x86_64=('03efc5ebc3f2159a497eb837e6c878a9a2a997d446e628e9e3a4445243c7129e')
sha256sums_aarch64=('03efc5ebc3f2159a497eb837e6c878a9a2a997d446e628e9e3a4445243c7129e')
sha256sums_i686=('03efc5ebc3f2159a497eb837e6c878a9a2a997d446e628e9e3a4445243c7129e')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 share/man/man1/sesh.1 "$pkgdir/usr/share/man/man1/${_pkgname}.1"
}
