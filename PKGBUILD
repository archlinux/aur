# This is an AUR PKGBUILD for gridlock-bin.
# Maintainer: Esaias Westberg <esaias@westbergs.se>
pkgname=gridlock-bin
pkgver=0.0.4 # Update this to the latest version
pkgrel=1
pkgdesc="A powerful TMUX session manager and automator"
arch=('x86_64' 'aarch64')
url="https://github.com/esaiaswestberg/gridlock"
license=('MIT')
depends=('tmux')
provides=('gridlock')
conflicts=('gridlock')
source_x86_64=("${url}/releases/download/v${pkgver}/gridlock_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/gridlock_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP') # Use 'updpkgsums' to update these
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "${srcdir}/gridlock" "${pkgdir}/usr/bin/gridlock"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
