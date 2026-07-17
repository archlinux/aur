# Maintainer: Ronald Lokers <ronald@lokers.email>
#
# Template — 2026.7.2 and 844f461dd220703ffe2c4e21af90b818503896d44d0448202334d497c420e133 are filled in by .github/workflows/aur.yml
# on each release. Installs the prebuilt musl binary from the GitHub Release.
pkgname=sugarrush-bin
pkgver=2026.7.2
pkgrel=1
pkgdesc="A terminal UI for viewing Nightscout CGM (blood glucose) data"
arch=('x86_64')
url="https://github.com/ronaldlokers/sugarrush"
license=('MIT')
provides=('sugarrush')
conflicts=('sugarrush')
options=('!strip')
source=("sugarrush-${pkgver}.tar.xz::https://github.com/ronaldlokers/sugarrush/releases/download/v${pkgver}/sugarrush-x86_64-unknown-linux-musl.tar.xz")
sha256sums=('844f461dd220703ffe2c4e21af90b818503896d44d0448202334d497c420e133')

package() {
  install -Dm755 sugarrush "${pkgdir}/usr/bin/sugarrush"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
