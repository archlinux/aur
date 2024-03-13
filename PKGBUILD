# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>

pkgname=slack-ozone
pkgver=1
pkgrel=2
pkgdesc='Launcher for Slack (system Electron version) on Ozone e.g. for native Wayland'
arch=(any)
depends=(slack-electron)
source=("$pkgname.desktop")

package() {
	install -Dvm644 slack-ozone.desktop -t "$pkgdir/usr/share/applications"
}
sha256sums=('9be30be22fdd05f08beb1358f472e4b0002bde83eee32f058e792da8f5b212e3')
