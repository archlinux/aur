# Maintainer:  Jay Chu <tothesong at gmail dot com>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>
# Contributor: Ciki Momogi <cikimomogi@protonmail.com>

pkgname=session-desktop-bin
pkgver=1.11.3
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
sha256sums=('9f1e8e472623f1248ccf0914d851e78ffcbdb074656a29aa9e84297e34d0aaec')

package() {
    tar xf $srcdir/data.tar.xz -C $pkgdir
}
