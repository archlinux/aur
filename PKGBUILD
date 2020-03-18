# Maintainer: Roland Auer <xxr01i1xx@tuta.io>

pkgname=session-desktop
pkgver=1.0.4
pkgrel=4
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
license=('GPL-3.0')
url="https://getsession.org"
conflicts=(session-desktop-bin session-desktop-git session-desktop-appimage)
source=("https://github.com/loki-project/session-desktop/releases/download/v${pkgver}/session-messenger-desktop-linux-amd64-${pkgver}.deb")
sha256sums=("792352d0862ecba075c785832a6dec7b9aa99e2da8a43de848bed6754d0f64e1")
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
optdepends=('libappindicator-gtk3: for tray support')
install=${pkgname}.install

package() {
          tar xf data.tar.xz -C ${pkgdir} --exclude='./control'
}
