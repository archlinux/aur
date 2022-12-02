# Maintainer: Norbert Pfeiler <norbert.pfeiler ät gmail.com>

pkgname=slack-ozone
pkgver=1
pkgrel=1
pkgdesc='Launcher for Slack (system Electron version) on Ozone e.g. for native Wayland'
arch=(any)
depends=(slack-electron)
source=("$pkgname.desktop")

package() {
	install -Dvm644 slack-ozone.desktop -t "$pkgdir/usr/share/applications"
}
sha256sums=('33d75c5665edbd9745de4082bd7ecd614110584babc3a62d7f274947112082b9')
