# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.9.0
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
sha256sums_x86_64=('92a615fe0cc23dafbdab45d7ec38d530edff171d12376f3d9a7af7992019541d')
sha256sums_arm64=('92a615fe0cc23dafbdab45d7ec38d530edff171d12376f3d9a7af7992019541d')
sha256sums_i386=('92a615fe0cc23dafbdab45d7ec38d530edff171d12376f3d9a7af7992019541d')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
