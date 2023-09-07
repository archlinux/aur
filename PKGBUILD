# Maintainer:  Jay Chu <tothesong at gmail dot com>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>

pkgname=session-desktop-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
url="https://getsession.org"
license=('GPL3')
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
optdepends=('libappindicator-gtk3: for tray support')
provides=(session-messenger-desktop)
conflicts=(session-messenger-desktop session-desktop session-desktop-git session-desktop-appimage)
options=(!strip)
install=$pkgname.install
source=(https://github.com/oxen-io/session-desktop/releases/download/v$pkgver/session-desktop-linux-amd64-$pkgver.deb)
sha256sums=('015ab586b84b62e9ef7e722ec3d76f00fb1b2e9aa5bc6b38df16907722d7f265')

package() {
    tar xf $srcdir/data.tar.xz -C $pkgdir
}
