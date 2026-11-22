# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Reticulum client for the terminal and the browser: LXMF messaging, NomadNet browsing and hosting, and RRC chat"
arch=('x86_64' 'aarch64')
url="https://github.com/rettui-dev/rettui"
license=('LicenseRef-Reticulum')
depends=('glibc' 'gcc-libs')
provides=('rettui')
conflicts=('rettui')
source_x86_64=("https://github.com/rettui-dev/rettui/releases/download/v${pkgver}/rettui-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rettui-dev/rettui/releases/download/v${pkgver}/rettui-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('36eab4e9dbd087c87538fb8c99eb4f3c059e134f01c8481d735d0be188ef114b')
sha256sums_aarch64=('95575b41c94dea4d7d62d9d24bda31d820f9144d40574ccfd58c3a33f0e75f7f')

package() {
  cd "rettui-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui "$pkgdir/usr/bin/rettui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rettui/LICENSE"
}
