# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.82.3
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use."
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache-2.0')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('6c3e5a2a5be8e5ab22cb67e29652d682d152c974c8e096c9c0209eddfc29d5a4')

package() {
    install -Dm755 rill "$pkgdir/usr/bin/rill"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
