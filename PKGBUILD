# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Reticulum client for the terminal and the browser: LXMF messaging, NomadNet browsing and hosting, and RRC chat"
arch=('x86_64' 'aarch64')
url="https://github.com/zevaryx/rettui"
license=('LicenseRef-Reticulum')
depends=('glibc' 'gcc-libs')
provides=('rettui')
conflicts=('rettui')
source_x86_64=("https://github.com/zevaryx/rettui/releases/download/v${pkgver}/rettui-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/zevaryx/rettui/releases/download/v${pkgver}/rettui-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8f0c5b8f03942adbd093969796c54f8f2463578bd8c69d782a2142eef9cb0ef0')
sha256sums_aarch64=('e574998dc796c01a3b2ddf3acffcff4bafc0277f497f47f7c185a7f528081217')

package() {
  cd "rettui-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui "$pkgdir/usr/bin/rettui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rettui/LICENSE"
}
