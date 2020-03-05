# Maintainer: Roland Auer <xxr01i1xx@tuta.io>

pkgname=session-desktop
pkgver=1.0.3
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
license=('GPL-3.0')
url="https://getsession.org"

source=()
sha256sums_x86_64=("5bf7cc6ff54239064c7a8d9b4cf6c25ad577fde7013a289f58eff9be41a9b9c0")
source_x86_64=("https://github.com/loki-project/session-desktop/releases/download/v${pkgver}/session-messenger-desktop-linux-amd64-${pkgver}.deb")

depends=("libnotify" "libappindicator-gtk3" "libxtst" "nss" "alsa-lib" "libxss")

package() {
          cd ${srcdir}
          tar xf data.tar.xz -C ${pkgdir} --exclude='./control'
}
