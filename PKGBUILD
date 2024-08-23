# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Smart session manager for the terminal"
arch=("x86_64" "arm64" "i386")
url="https://github.com/joshmedeski/sesh"
license=("MIT")
depends=("zoxide" "tmux")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_arm64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('b9767412c64f84745af44f3d97a3e96abb384de72e0fd2ed05e90ffbc7a994f7')
sha256sums_arm64=('b9767412c64f84745af44f3d97a3e96abb384de72e0fd2ed05e90ffbc7a994f7')
sha256sums_i386=('b9767412c64f84745af44f3d97a3e96abb384de72e0fd2ed05e90ffbc7a994f7')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
