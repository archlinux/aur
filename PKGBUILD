# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Contributor: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>
pkgname=session-desktop-bin
pkgver=1.6.4
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
source=(https://github.com/oxen-io/session-desktop/releases/download/v$pkgver/session-desktop-linux-amd64-$pkgver.deb)
sha256sums=('b50a9e75e8f493fffe1afa76c92cbab6a80ede4def29fd3cc6b29ca06a2ddc02')

package() {
    tar xf $srcdir/data.tar.xz -C $pkgdir
}
