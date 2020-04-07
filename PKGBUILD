# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>
pkgname=session-desktop-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
url="https://getsession.org"
license=('GPL-3.0')
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
optdepends=('libappindicator-gtk3: for tray support')
provides=(session-messenger-desktop)
conflicts=(session-desktop session-desktop-git session-desktop-appimage)
options=(!strip)
install=$pkgname.install
source=(https://github.com/loki-project/session-desktop/releases/download/v$pkgver/session-messenger-desktop-linux-amd64-$pkgver.deb)
sha256sums=('4a2f8832887cd901bf091d6122aa20d9f6317db62b922407b5e9ebbf72cb439c')

package() {
    tar xf $srcdir/data.tar.xz -C $pkgdir
}
